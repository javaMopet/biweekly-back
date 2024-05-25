# frozen_string_literal: true

module Mutations
  class RegistroTarjetaDelete < BaseMutation
    include UpdateAccountBalanceCredit
    description "Deletes a registro_tarjeta by ID"

    field :registro_tarjeta, Types::RegistroTarjetaType, null: false

    argument :id, ID, required: true

    # default method
    def resolve(id:)
      ActiveRecord::Base.transaction do
        registro_tarjeta = ::RegistroTarjeta.find(id)

        authorize!(:destroy, registro_tarjeta)

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
