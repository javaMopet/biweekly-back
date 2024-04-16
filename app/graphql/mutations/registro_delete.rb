# frozen_string_literal: true

module Mutations
  class RegistroDelete < BaseMutation
    include UpdateAccountBalance
    description "Deletes a registro by ID"

    field :registro, Types::RegistroType, null: false

    argument :id, ID, required: true

    # default method
    def resolve(id:)
      ActiveRecord::Base.transaction do
        registro = ::Registro.find(id)
        unless can? :destroy, registro
          raise GraphQL::ExecutionError.new "error: unauthorized access: delete 'registro'",
                                            extensions: { code: :unauthorized }
        end
        unless registro.destroy
          raise GraphQL::ExecutionError.new "Error deleting registro", extensions: registro.errors.to_hash
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
