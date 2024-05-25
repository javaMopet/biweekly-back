# frozen_string_literal: true

module Mutations
  # Creacion de un nuevo Estado Movimiento
  class EstadoMovimientoCreate < BaseMutation
    description 'Creates a new estado_movimiento'

    field :estado_movimiento, Types::EstadoMovimientoType, null: false

    argument :estado_movimiento_input, Types::EstadoMovimientoInputType, required: true

    # main method
    def resolve(estado_movimiento_input:)
      estado_movimiento = ::EstadoMovimiento.new(**estado_movimiento_input)

      authorize!(:save, estado_movimiento)

      unless estado_movimiento.save
        raise GraphQL::ExecutionError.new 'Error creating estado_movimiento',
                                          extensions: estado_movimiento.errors.to_hash
      end

      { estado_movimiento: }
    end
  end
end
