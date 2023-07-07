# frozen_string_literal: true

module Mutations
  class RegistroDelete < BaseMutation
    include UpdateAccountBalance
    description "Deletes a registro by ID"

    field :registro, Types::RegistroType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      ActiveRecord::Base.transaction do
        registro = ::Registro.find(id)
        raise GraphQL::ExecutionError.new "Error deleting registro", extensions: registro.errors.to_hash unless registro.destroy

        update_account_balance registro.cuenta.id

        { registro: }
      rescue StandardError => e
        puts e
        raise e
      end
    end
  end
end
