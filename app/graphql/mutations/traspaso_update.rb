# frozen_string_literal: true

module Mutations
  class TraspasoUpdate < BaseMutation
    include UpdateAccountBalance
    description "Updates a traspaso by id"

    field :traspaso, Types::TraspasoType, null: false
    field :cuentas_ids, [ID], null: false
    field :cuentas, [Types::Cuentas::CuentaType], null: false

    argument :id, ID, required: true
    argument :traspaso_input, Types::TraspasoInputType, required: true
    argument :traspasos_detalle_input, [Types::TraspasoDetalleInputType], required: true

    # default method
    def resolve(id:, traspaso_input:, traspasos_detalle_input:)
      traspaso = ::Traspaso.find(id)

      authorize!(:update, traspaso)

      cuentas_ids = traspaso.traspaso_detalles.map { |item| item.cuenta_id.to_s }
      cuentas_ids.concat(traspasos_detalle_input.map(&:cuenta_id))
      cuentas_ids.uniq!

      actualizar_detalles traspasos_detalle_input, traspaso_input.fecha
      unless traspaso.update(**traspaso_input)
        raise GraphQL::ExecutionError.new "Error updating traspaso", extensions: traspaso.errors.to_hash
      end

      cuentas = []

      cuentas_ids.each do |td|
        cuenta = update_account_balance td
        cuentas.push(cuenta)
      end

      { traspaso:, cuentas_ids: cuentas_ids.uniq, cuentas: }
    end

    # Se actualizan los detalles del traspaso
    def actualizar_detalles(traspasos_detalle_input, fecha)
      traspasos_detalle_input.each do |td_param|
        traspaso_detalle = TraspasoDetalle.find(td_param.id)
        traspaso_detalle.update(**td_param)
        registro = Registro.find(traspaso_detalle.registro_id)
        p "Actualziando el registro .......................................=============="
        p td_param.importe
        p td_param.tipo_cuenta_traspaso_id
        p td_param.tipo_cuenta_traspaso_id == '1'
        p td_param.cuenta_id
        importe =
          if td_param.tipo_cuenta_traspaso_id == '1'
            td_param.importe * -1
          else
            td_param.importe
          end

        registro.update(importe:, fecha:, cuenta_id: td_param.cuenta_id)
      end
    end
  end
end
