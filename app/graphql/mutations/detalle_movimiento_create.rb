# frozen_string_literal: true

module Mutations
  # Creacion de un nuevo Detalle de Movimiento
  class DetalleMovimientoCreate < BaseMutation
    description 'Creates a new detalle_movimiento'

    field :detalle_movimiento, Types::DetalleMovimientoType, null: false

    argument :detalle_movimiento_input, Types::DetalleMovimientoInputType, required: true

    # main method
    def resolve(detalle_movimiento_input:)
      detalle_movimiento = ::DetalleMovimiento.new(**detalle_movimiento_input)

      authorize!(:save, detalle_movimiento)

      unless detalle_movimiento.save
        raise GraphQL::ExecutionError.new 'Error creating detalle_movimiento',
                                          extensions: detalle_movimiento.errors.to_hash
      end

      { detalle_movimiento: }
    end
  end
end
