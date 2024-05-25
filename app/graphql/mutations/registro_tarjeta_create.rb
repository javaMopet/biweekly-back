# frozen_string_literal: true

module Mutations
  class RegistroTarjetaCreate < BaseMutation
    include UpdateAccountBalanceCredit
    description "Creates a new registro_tarjeta"

    field :registro_tarjeta, Types::RegistroTarjetaType, null: false

    argument :registro_tarjeta_input, Types::RegistroTarjetaInputType, required: true

    # Main resolver
    def resolve(registro_tarjeta_input:)
      ActiveRecord::Base.transaction do
        registro_tarjeta = ::RegistroTarjeta.new(**registro_tarjeta_input)

        authorize!(:create, registro_tarjeta)

        unless registro_tarjeta.save
          raise GraphQL::ExecutionError.new "Error creating registro_tarjeta",
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
