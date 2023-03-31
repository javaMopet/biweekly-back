# frozen_string_literal: true

module Mutations
  class MovimientoUpdate < BaseMutation
    description "Updates a movimiento by id"

    field :movimiento, Types::MovimientoType, null: false

    argument :id, ID, required: true
    argument :movimiento_input, Types::MovimientoInputType, required: true

    def resolve(id:, movimiento_input:)
      movimiento = ::Movimiento.find(id)
      raise GraphQL::ExecutionError.new "Error updating movimiento", extensions: movimiento.errors.to_hash unless movimiento.update(**movimiento_input)

      { movimiento: movimiento }
    end
  end
end
