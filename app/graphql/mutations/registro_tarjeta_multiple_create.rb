# frozen_string_literal: true

module Mutations
  class RegistroTarjetaMultipleCreate < BaseMutation
    include UpdateAccountBalanceCredit
    description "Creates a new registro_tarjeta"

    field :registros_tarjeta, [Types::RegistroTarjetaType], null: false

    argument :registros_tarjeta_input, [Types::RegistroTarjetaInputType], required: true

    # main method resolver
    def resolve(registros_tarjeta_input:)
      ActiveRecord::Base.transaction do
        retorno = []

        # p registros_tarjeta_input

        registros_tarjeta_input.each do |registro_param|
          registro_tarjeta = ::RegistroTarjeta.new(**registro_param)
          unless registro_tarjeta.save
            raise GraphQL::ExecutionError.new "Error creating registro_tarjeta",
                                              extensions: registro_tarjeta.errors.to_hash
          end
          retorno.push(registro_tarjeta)
        end

        # update_account_balance_credit retorno.first.cuenta.id

        { registros_tarjeta: retorno }
      rescue StandardError => e
        puts e
        raise e
      end
    end
  end
end
