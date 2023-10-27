# frozen_string_literal: true

module Mutations
  class ImportarRegistros < BaseMutation
    include UpdateAccountBalance
    description "Importacion de registros"

    field :registros, [Types::RegistroType], null: false

    argument :registros_input, [Types::RegistroInputType], required: true
    argument :traspasos_input, [Types::TraspasoInputType], required: true
    # argument :traspaso_detalles_input, [Types::TraspasoDetalleInputType], required: true

    # Creacion de registros y traspasos
    def resolve(registros_input:, traspasos_input:)
      ApplicationRecord.transaction do
        registros = []
        registros_input.each do |ri|
          registro = Registro.new(**ri)
          unless registro.save
            raise GraphQL::ExecutionError.new "Error creating traspaso", extensions: registro.errors.to_hash
          end

          registros.push(registro)
        end

        traspasos_input.each do |ti|
          traspaso = create_traspaso ti
          unless traspaso.save
            raise GraphQL::ExecutionError.new "Error creating traspaso #{traspaso.errors.full_messages}",
                                              extensions: traspaso.errors.to_hash
          end
        end

        # Actualizar cuentas y agregar registros de traspasos
        cuentas = []

        traspasos_input.each do |traspaso_param|
          detalles_param = traspaso_param[:traspaso_detalles]
          detalles_param.each do |traspaso_detalle|
            cuentas.push(traspaso_detalle[:cuenta_id])
          end
        end

        cuentas.uniq.each do |cuenta_id|
          update_account_balance cuenta_id
        end

        { registros: }
      end
    rescue ActiveRecord::RecordInvalid => e
      puts e.record.errors.to_json
      { error: 'Error al crear el traspaso.', exception: e }
    end

    # Funcion para crear un traspaso y sus respectivos detalles
    def create_traspaso(traspaso_param)
      traspaso = ::Traspaso.new(traspaso_param.to_hash.except!(:traspaso_detalles))

      traspaso.traspaso_detalles = create_traspaso_detalles traspaso_param[:traspaso_detalles],
                                                            traspaso,
                                                            traspaso.fecha,
                                                            traspaso.user_id
      traspaso
    end

    # Funcion para crear los detalles de un traspaso
    def create_traspaso_detalles(traspaso_detalles_param, traspaso, fecha, user_id)
      traspaso_detalles = []
      traspaso_detalles_param.each do |detalle_param|
        traspaso_detalle = create_detalle_traspaso detalle_param, fecha, user_id
        traspaso_detalle.traspaso = traspaso
        traspaso_detalles.push(traspaso_detalle)
      end
      traspaso_detalles
    end

    # Funcion que crea un detalle de traspaso
    def create_detalle_traspaso(detalle_param, fecha, user_id)
      traspaso_detalle = TraspasoDetalle.new
      traspaso_detalle.cuenta_id = detalle_param[:cuenta_id]
      traspaso_detalle.tipo_cuenta_traspaso_id = detalle_param[:tipo_cuenta_traspaso_id]
      traspaso_detalle.importe = detalle_param[:importe]
      traspaso_detalle.registro = create_registro_traspaso(detalle_param, fecha, user_id)
      # raise GraphQL::ExecutionError.new "Error creating traspaso #{traspaso_detalle.errors.full_messages}",
      # extensions: traspaso_detalle.errors.to_hash unless traspaso_detalle.save
      traspaso_detalle
    end

    # Funcion que crea un detalle de registro
    # def create_registro(detalle_param)
    #   registro = Registro.new
    #   registro.estado_registro_id = 2
    #   registro.tipo_afectacion =  detalle_param.tipo_afectacion
    #   registro.importe = detalle_param.importe
    #   registro.fecha = detalle_param.fecha
    #   registro.cuenta_id = detalle_param.cuenta_id
    #   registro.observaciones = detalle_param.observaciones
    #   registro.user_id = detalle_param.user_id

    #   registro
    # end

    # Funcion que crea un detalle de registro
    def create_registro_traspaso(traspaso_detalle_param, fecha, user_id)
      registro = Registro.new
      # estatus cerrado
      registro.estado_registro_id = 2
      tipo_cuenta_traspaso_id = traspaso_detalle_param[:tipo_cuenta_traspaso_id]
      registro.tipo_afectacion = tipo_cuenta_traspaso_id == 1 ? 'A' : 'C'
      registro.importe = traspaso_detalle_param[:importe]
      registro.fecha = fecha
      registro.observaciones = 'Traspaso entre cuentas'
      registro.user_id = user_id
      registro.cuenta_id = traspaso_detalle_param[:cuenta_id]

      registro
    end
  end
end
