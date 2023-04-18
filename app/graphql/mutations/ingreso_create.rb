# frozen_string_literal: true

module Mutations
  # Creación de un movimiento de ingreso
  class IngresoCreate < BaseMutation
    description 'Creates a new ingreso'

    field :ingreso, Types::IngresoType, null: false

    argument :ingreso_input, Types::IngresoInputType, required: true

    def resolve(ingreso_input:)
      ingreso = ::Ingreso.new(**ingreso_input)
      unless ingreso.save
        raise GraphQL::ExecutionError.new 'Error creating ingreso',
                                          extensions: ingreso.errors.to_hash
      end

      { ingreso: }
    end
  end
end
