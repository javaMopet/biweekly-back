# frozen_string_literal: true

module Mutations
  class EstadoMovimientoDelete < BaseMutation
    description "Deletes a estado_movimiento by ID"

    field :estado_movimiento, Types::EstadoMovimientoType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      estado_movimiento = ::EstadoMovimiento.find(id)
      raise GraphQL::ExecutionError.new "Error deleting estado_movimiento", extensions: estado_movimiento.errors.to_hash unless estado_movimiento.destroy

      { estado_movimiento: estado_movimiento }
    end
  end
end
