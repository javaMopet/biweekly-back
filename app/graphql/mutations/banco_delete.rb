# frozen_string_literal: true

module Mutations
  class BancoDelete < BaseMutation
    description "Deletes a banco by ID"

    field :banco, Types::BancoType, null: false

    argument :id, ID, required: true

    # Default method
    def resolve(id:)
      banco = ::Banco.find(id)
      raise GraphQL::ExecutionError.new "Error deleting banco", extensions: banco.errors.to_hash unless banco.destroy

      { banco: }
    end
  end
end
