# frozen_string_literal: true

module Mutations
  class DetalleMovimientoUpdate < BaseMutation
    description "Updates a detalle_movimiento by id"

    field :detalle_movimiento, Types::DetalleMovimientoType, null: false

    argument :id, ID, required: true
    argument :detalle_movimiento_input, Types::DetalleMovimientoInputType, required: true

    def resolve(id:, detalle_movimiento_input:)
      detalle_movimiento = ::DetalleMovimiento.find(id)
      raise GraphQL::ExecutionError.new "Error updating detalle_movimiento", extensions: detalle_movimiento.errors.to_hash unless detalle_movimiento.update(**detalle_movimiento_input)

      { detalle_movimiento: detalle_movimiento }
    end
  end
end
