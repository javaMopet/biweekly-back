# frozen_string_literal: true

module Mutations
  class DetalleMovimientoDelete < BaseMutation
    description "Deletes a detalle_movimiento by ID"

    field :detalle_movimiento, Types::DetalleMovimientoType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      detalle_movimiento = ::DetalleMovimiento.find(id)
      raise GraphQL::ExecutionError.new "Error deleting detalle_movimiento", extensions: detalle_movimiento.errors.to_hash unless detalle_movimiento.destroy

      { detalle_movimiento: detalle_movimiento }
    end
  end
end
