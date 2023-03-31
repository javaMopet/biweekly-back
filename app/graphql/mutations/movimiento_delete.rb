# frozen_string_literal: true

module Mutations
  class MovimientoDelete < BaseMutation
    description "Deletes a movimiento by ID"

    field :movimiento, Types::MovimientoType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      movimiento = ::Movimiento.find(id)
      raise GraphQL::ExecutionError.new "Error deleting movimiento", extensions: movimiento.errors.to_hash unless movimiento.destroy

      { movimiento: movimiento }
    end
  end
end
