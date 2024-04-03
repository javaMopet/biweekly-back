# frozen_string_literal: true

module Mutations
  class RegistrosTarjetaDelete < BaseMutation
    include UpdateAccountBalanceCredit
    description "Deletes a registros de tarjeta by IDs"

    field :saldo, Float, null: false

    argument :ids, String, required: true

    # Metodo revolver
    def resolve(ids:)
      ActiveRecord::Base.transaction do
        registros = RegistroTarjeta.where(id: ids.split(','), estado_registro_tarjeta_id: 1)
        cuenta_id = registros[0].cuenta.id

        unless registros.delete_all
          raise GraphQL::ExecutionError.new "Error deleting registro", extensions: RegistroTarjeta.errors.to_hash
        end

        cuenta = update_account_balance_credit cuenta_id

        { saldo: cuenta.saldo }
      rescue StandardError => e
        raise GraphQL::ExecutionError.new(e.message, extensions: [{ code: 110, from: 'Registros' }])
      end
    end
  end
end
