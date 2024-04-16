# frozen_string_literal: true

module Mutations
  class RegistroTarjetaUpdate < BaseMutation
    include UpdateAccountBalanceCredit
    description "Updates a registro_tarjeta by id"

    field :registro_tarjeta, Types::RegistroTarjetaType, null: false

    argument :id, ID, required: true
    argument :registro_tarjeta_input, Types::RegistroTarjetaInputType, required: true

    # main resolver
    def resolve(id:, registro_tarjeta_input:)
      ActiveRecord::Base.transaction do
        registro_tarjeta = ::RegistroTarjeta.find(id)
        unless can? :update, registro_tarjeta
          raise GraphQL::ExecutionError.new "error: unauthorized access: update 'registro_tarjeta'",
                                            extensions: { code: :unauthorized }
        end
        unless registro_tarjeta.update(**registro_tarjeta_input)
          raise GraphQL::ExecutionError.new "Error updating registro_tarjeta #{registro_tarjeta.errors.full_messages}",
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
