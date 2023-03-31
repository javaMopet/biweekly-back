# frozen_string_literal: true

module Mutations
  class MovimientoCreate < BaseMutation
    description "Creates a new movimiento"

    field :movimiento, Types::MovimientoType, null: false

    argument :movimiento_input, Types::MovimientoInputType, required: true

    def resolve(movimiento_input:)
      movimiento = ::Movimiento.new(**movimiento_input)
      raise GraphQL::ExecutionError.new "Error creating movimiento", extensions: movimiento.errors.to_hash unless movimiento.save

      { movimiento: movimiento }
    end
  end
end
