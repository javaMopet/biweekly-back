# frozen_string_literal: true

module Mutations
  class RegistroCreate < BaseMutation
    description "Creates a new registro"

    field :registro, Types::RegistroType, null: false

    argument :registro_input, Types::RegistroInputType, required: true

    def resolve(registro_input:)
      registro = ::Registro.new(**registro_input)
      raise GraphQL::ExecutionError.new "Error creating registro", extensions: registro.errors.to_hash unless registro.save

      { registro: registro }
    end
  end
end
