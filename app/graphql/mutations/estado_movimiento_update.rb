# frozen_string_literal: true

module Mutations
  class EstadoMovimientoUpdate < BaseMutation
    description "Updates a estado_movimiento by id"

    field :estado_movimiento, Types::EstadoMovimientoType, null: false

    argument :id, ID, required: true
    argument :estado_movimiento_input, Types::EstadoMovimientoInputType, required: true

    def resolve(id:, estado_movimiento_input:)
      estado_movimiento = ::EstadoMovimiento.find(id)
      raise GraphQL::ExecutionError.new "Error updating estado_movimiento", extensions: estado_movimiento.errors.to_hash unless estado_movimiento.update(**estado_movimiento_input)

      { estado_movimiento: estado_movimiento }
    end
  end
end
