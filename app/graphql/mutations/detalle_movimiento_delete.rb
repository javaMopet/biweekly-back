# frozen_string_literal: true

module Mutations
  class DetalleMovimientoDelete < BaseMutation
    description "Deletes a detalle_movimiento by ID"

    field :detalle_movimiento, Types::DetalleMovimientoType, null: false

    argument :id, ID, required: true

    # main method
    def resolve(id:)
      detalle_movimiento = ::DetalleMovimiento.find(id)

      authorize!(:destroy, detalle_movimiento)

      unless detalle_movimiento.destroy
        raise GraphQL::ExecutionError.new "Error deleting detalle_movimiento",
                                          extensions: detalle_movimiento.errors.to_hash
      end

      { detalle_movimiento: detalle_movimiento }
    end
  end
end
