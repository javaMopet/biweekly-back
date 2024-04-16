# frozen_string_literal: true

module Mutations
  class RegistroUpdate < BaseMutation
    include UpdateAccountBalance
    description "Updates a registro by id"

    field :registro, Types::RegistroType, null: false

    argument :id, ID, required: true
    argument :registro_input, Types::RegistroInputType, required: true

    # main resolver
    def resolve(id:, registro_input:)
      ActiveRecord::Base.transaction do
        registro = ::Registro.find(id)
        unless can? :update, registro
          raise GraphQL::ExecutionError.new "error: unauthorized access: update 'registro'",
                                            extensions: { code: :unauthorized }
        end
        unless registro.update(**registro_input)
          raise GraphQL::ExecutionError.new "Error updating registro", extensions: registro.errors.to_hash
        end

        update_account_balance registro.cuenta.id

        { registro: }
      rescue StandardError => e
        puts e
        raise e
      end
    end
  end
end
