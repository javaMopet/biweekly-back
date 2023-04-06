# frozen_string_literal: true

module Mutations
  # Creación de un movimiento
  class MovimientoCreate < BaseMutation
    description 'Creates a new movimiento'

    field :movimiento, Types::MovimientoType, null: false

    argument :movimiento_input, Types::MovimientoInputType, required: true
    argument :detalles_movimiento_input, [Types::DetalleMovimientoInputType], required: false

    def resolve(movimiento_input:, detalles_movimiento_input:)
      p 'guardando el movimiento*********************************************'
      p movimiento_input
      p 'detalles movimiento input*********************>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><'
      p detalles_movimiento_input

      # movimiento_input["detalles_movimiento"] = []

      movimiento = ::Movimiento.new(**movimiento_input)
      obtener_detalles detalles_movimiento_input, movimiento

      # p detalles_movimiento_input
      unless movimiento.save
        raise GraphQL::ExecutionError.new "Error creating movimiento #{movimiento.errors.full_messages}",
                                          extensions: movimiento.errors.to_hash
      end

      { movimiento: }
    end

    def obtener_detalles(detalles_movimiento_input, movimiento)
      detalles_movimiento = []

      detalles_movimiento_input.each do |detalle|
        detalle_movimiento = obtener_detalle detalle # ::DetalleMovimiento.new(**detalle)
        detalle_movimiento.movimiento = movimiento
        detalles_movimiento.push(detalle_movimiento)
      end
      movimiento.detalles_movimiento = detalles_movimiento
      detalles_movimiento
    end

    def obtener_detalle(detalle)
      detalle_movimiento = DetalleMovimiento.new
      detalle_movimiento.categoria_id = detalle.categoria_id
      detalle_movimiento.cuenta_id = detalle.cuenta_id
      detalle_movimiento.importe = detalle.importe
      detalle_movimiento.tipo_afectacion = 'C'
      detalle_movimiento.tipo_detalle = 'N'
      detalle_movimiento.cuenta_contable_id = 51_203
      detalle_movimiento
    end
  end
end
