# frozen_string_literal: true

module Mutations
  class RegistroTarjetaPagoDelete < BaseMutation
    include UpdateAccountBalanceCredit
    description "Deletes a registro_tarjeta de tipo pago by ID"

    field :registro_tarjeta, Types::RegistroTarjetaType, null: false

    argument :id, ID, required: true

    # default method
    def resolve(id:)
      ActiveRecord::Base.transaction do
        # Se busca el registro del pago
        registro_tarjeta = ::RegistroTarjeta.find(id)

        authorize!(:destroy, registro_tarjeta)

        # Se busca el pago tarjeta
        pago_tarjeta_id = registro_tarjeta.pago_tarjeta_id
        # con el pago tarjeta se buscan los registros asociados al registro_tarjeta -> registo
        # Delete from resgistros where id in (select registro_id from registros_tarjeta where pago_tarjeta_id = 5 )
        Registro.joins(:registro_tarjeta).where(registro_tarjeta: { pago_tarjeta_id: }).destroy_all

        RegistroTarjeta.where(pago_tarjeta_id:).update_all(estado_registro_tarjeta_id: 1, pago_tarjeta_id: nil)

        # Actualizar los registros de tarjeta asociados con el pago

        # Eliminar el registro del pago
        registro_tarjeta.destroy

        unless registro_tarjeta.destroy
          raise GraphQL::ExecutionError.new "Error deleting registro_tarjeta",
                                            extensions: registro_tarjeta.errors.to_hash
        end

        update_account_balance_credit registro_tarjeta.cuenta.id

        { registro_tarjeta: }
      rescue StandardError => e
        puts e
        raise e
      end
    end
  end
end
