# frozen_string_literal: true

module Mutations
  class TraspasoCreate < BaseMutation
    description "Creates a new traspaso"

    field :traspaso, Types::TraspasoType, null: false

    argument :traspaso_input, Types::TraspasoInputType, required: true
    argument :traspasos_detalle_input, [Types::TraspasoDetalleInputType], required: true

    def resolve(traspaso_input:, traspasos_detalle_input:)
      ApplicationRecord.transaction do 

        traspaso = ::Traspaso.new(**traspaso_input)

        traspasos_detalle_input.each do |td|
          detalle = create_detalle_traspaso td, traspaso.fecha
          detalle.traspaso = traspaso 
          traspaso.traspaso_detalles.push(detalle)
        end 

        raise GraphQL::ExecutionError.new "Error creating traspaso", extensions: traspaso.errors.to_hash unless traspaso.save

        { traspaso: traspaso }
      end 
    rescue ActiveRecord::RecordInvalid => e
      puts e.record.errors.to_json
      { error: 'Error al crear el traspaso.', exception: e }    
    end

    def create_detalle_traspaso(detalle, fecha)
      det = TraspasoDetalle.new
      det.cuenta_id  = detalle.cuenta_id
      det.tipo_cuenta_traspaso_id = detalle.tipo_cuenta_traspaso_id
      det.importe = detalle.importe
      det.registro = create_registro detalle, fecha 

      det
    end 
    def create_registro(detalle, fecha)       
      registro = Registro.new
      registro.estado_registro_id =  2
      registro.tipo_afectacion =  detalle.tipo_cuenta_traspaso_id == 2 ? 'A' : 'C'      
      registro.importe = detalle.tipo_cuenta_traspaso_id == 2 ? detalle.importe * -1 : detalle.importe
      registro.fecha = fecha
      registro.observaciones = 'Traspaso entre cuentas'
      registro.cuenta_id = detalle.cuenta_id

      registro
    end 
  end
end
