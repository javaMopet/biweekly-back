# frozen_string_literal: true

module Mutations
  class RegistroDelete < BaseMutation
    description "Deletes a registro by ID"

    field :registro, Types::RegistroType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      registro = ::Registro.find(id)
      raise GraphQL::ExecutionError.new "Error deleting registro", extensions: registro.errors.to_hash unless registro.destroy

      { registro: }
    end
  end
end
