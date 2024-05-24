# frozen_string_literal: true

# Controlador para registros
class MovimientosController < ApplicationController
  include MovimientosToExcel
  before_action :authenticate_user_from_token!

  # GET /movimientos/columnas
  def columnas
    ejercicio_fiscal = Integer(params.fetch(:ejercicio_fiscal, 0))
    mes = Integer(params.fetch(:mes, 0))
    is_saldos = Integer(params.fetch(:is_saldos, 0))
    render json: { data: Pro::DataImport.buscar_columnas(ejercicio_fiscal, mes, is_saldos) }
  end

  # GET /movimientos/ingresos_egresos
  def ingresos_egresos
    ejercicio_fiscal = Integer(params.fetch(:ejercicioFiscalId, 0), 0)
    mes_id = Integer(params.fetch(:mesId, 0), 0)
    tipo_movimiento_id = Integer(params.fetch(:tipoMovimientoId, 0), 0)
    is_saldos = Integer(params.fetch(:isSaldos, 0), 0)
    instance_id = current_user.instance_id
    render json: {
      data: Pro::DataImport.buscar_movimientos(ejercicio_fiscal, mes_id, tipo_movimiento_id, is_saldos, instance_id)
    }
  end

  # GET /movimientos/saldos_ingresos_egresos
  def saldos_ingresos_egresos
    ejercicio_fiscal_id = Integer(params.fetch(:ejercicioFiscalId, 0))
    mes_id = Integer(params.fetch(:mesId, 0))
    instance_id = current_user.instance_id
    render json: { data: Pro::DataImport.buscar_saldos_ingresos_egresos(ejercicio_fiscal_id, mes_id, instance_id) }
  end

  # GET /saldos_cuentas
  def saldos_cuentas
    ejercicio_fiscal_id = Integer(params.fetch(:ejercicioFiscalId, 0), 0)
    mes_id = Integer(params.fetch(:mesId, 0))
    is_saldos = Integer(params.fetch(:isSaldos, 0))
    instance_id = current_user.instance_id

    render json: { data: Pro::DataImport.buscar_saldos_cuentas(ejercicio_fiscal_id, mes_id, is_saldos, instance_id) }
  end

  # GET /saldos_finales
  def saldos_finales
    ejercicio_fiscal_id = Integer(params.fetch(:ejercicioFiscalId, 0), 0)
    mes_id = Integer(params.fetch(:mesId, 0))
    instance_id = current_user.instance_id
    render json: { data: Pro::DataImport.pa_saldos_finales(ejercicio_fiscal_id, mes_id, instance_id) }
  end

  # exportar movimientos a excel
  def to_excel
    ejercicio_fiscal_id = Integer(params.fetch(:ejercicioFiscalId, 0))
    mes_id = Integer(params.fetch(:mesId, 0))
    instance_id = current_user.instance_id

    send_data(
      movimientos_to_excel(ejercicio_fiscal_id, instance_id).read,
      type: 'application/vnd.ms-excel',
      disposition: 'attachment',
      filename: 'myfile.xlsx'
    )
  end
end
