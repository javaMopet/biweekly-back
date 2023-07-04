# frozen_string_literal: true

module Mutations
  class RegistroUpdate < BaseMutation
    description "Updates a registro by id"

    field :registro, Types::RegistroType, null: false

    argument :id, ID, required: true
    argument :registro_input, Types::RegistroInputType, required: true

    def resolve(id:, registro_input:)
      registro = ::Registro.find(id)
      raise GraphQL::ExecutionError.new "Error updating registro", extensions: registro.errors.to_hash unless registro.update(**registro_input)

      { registro: }
    end
  end
end
