# frozen_string_literal: true

module Mutations
  class TraspasoCreate < BaseMutation
    include UpdateAccountBalance
    description "Creates a new traspaso"

    field :traspaso, Types::TraspasoType, null: false

    argument :traspaso_input, Types::TraspasoInputType, required: true
    argument :traspasos_detalle_input, [Types::TraspasoDetalleInputType], required: true

    # resolver
    def resolve(traspaso_input:, traspasos_detalle_input:)
      ApplicationRecord.transaction do
        traspaso = ::Traspaso.new(**traspaso_input)

        authorize!(:save, traspaso)

        observaciones = traspaso.observaciones

        traspasos_detalle_input.each do |td|
          detalle = create_detalle_traspaso td, traspaso.fecha, traspaso.user_id, observaciones
          detalle.traspaso = traspaso
          traspaso.traspaso_detalles.push(detalle)
        end

        unless traspaso.save
          raise GraphQL::ExecutionError.new "Error creating traspaso #{traspaso.errors.full_messages}",
                                            extensions: traspaso.errors.to_hash
        end

        traspaso.traspaso_detalles.each do |td|
          p "Detalles de traspaso ***********************************************************"
          p td
          update_account_balance td.cuenta.id
          p "Detalles de traspaso ***********************************************************"
        end

        { traspaso: }
      end
    rescue ActiveRecord::RecordInvalid => e
      puts e.record.errors.to_json
      { error: 'Error al crear el traspaso.', exception: e }
    end

    # Funcion que crea un traspaso con sus detalles
    def create_detalle_traspaso(detalle, fecha, user_id, observaciones)
      det = TraspasoDetalle.new
      det.cuenta_id = detalle.cuenta_id
      det.tipo_cuenta_traspaso_id = detalle.tipo_cuenta_traspaso_id
      det.importe = detalle.importe
      det.registro = create_registro detalle, fecha, user_id, observaciones
      # raise GraphQL::ExecutionError.new "Error creating traspaso #{det.errors.full_messages}",
      # extensions: det.errors.to_hash unless det.save
      det
    end

    # Funcion especificada para crear un registro de cuenta
    def create_registro(detalle, fecha, user_id, observaciones)
      registro = Registro.new
      registro.estado_registro_id = 2
      registro.tipo_afectacion =  detalle.tipo_cuenta_traspaso_id == '1' ? 'C' : 'A'
      registro.importe = detalle.tipo_cuenta_traspaso_id == '1' ? detalle.importe * -1 : detalle.importe
      registro.fecha = fecha
      registro.tipo_cuenta_traspaso_id = detalle.tipo_cuenta_traspaso_id
      registro.observaciones = observaciones
      registro.user_id = user_id
      registro.cuenta_id = detalle.cuenta_id

      # raise GraphQL::ExecutionError.new "Error creating traspaso #{registro.errors.full_messages}",
      # extensions: registro.errors.to_hash unless registro.save
      registro
    end
  end
end
