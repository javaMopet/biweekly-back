# frozen_string_literal: true

module Mutations
  class RegistroMultipleCreate < BaseMutation
    include UpdateAccountBalance
    description "Creates new multiples registros"

    field :registros, [Types::RegistroType], null: false

    argument :registros_input, [Types::RegistroInputType], required: true

    # main method resolver
    def resolve(registros_input:)
      ActiveRecord::Base.transaction do
        retorno = []

        registros_input.each do |registro_param|
          p registro_param

          registro = ::Registro.new(**registro_param)
          unless registro.save
            raise GraphQL::ExecutionError.new "Error creating registro", extensions: registro.errors.to_hash
          end

          retorno.push(registro)
        end

        # update_account_balance_credit retorno.first.cuenta.id

        { registros: retorno }
      rescue StandardError => e
        puts e
        raise e
      end
    end
  end
end
