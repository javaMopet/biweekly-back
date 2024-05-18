# frozen_string_literal: true

# Controlador para registros
class RegistrosController < ApplicationController
  include UpdateAccountBalance
  before_action :authenticate_user_from_token!
  before_action :set_registro, only: %i[show update destroy]

  # GET /registros
  def index
    @registros = Registro.all

    render json: @registros
  end

  # GET /columnas
  def columnas
    ejercicio_fiscal = Integer(params.fetch(:ejercicio_fiscal,0))
    mes = Integer(params.fetch(:mes, 0))
    is_saldos = Integer(params.fetch(:is_saldos, 0))
    p "is_saldos: #{is_saldos}"
    render json: { data: Pro::DataImport.buscar_columnas(ejercicio_fiscal, mes, is_saldos) }
  end

  # GET /movimientos
  def movimientos
    ejercicio_fiscal = Integer(params.fetch(:ejercicioFiscalId,0),0)
    mes_id = Integer(params.fetch(:mesId,0),0)
    tipo_movimiento_id = Integer(params.fetch(:tipoMovimientoId, 0),0)
    is_saldos = Integer(params.fetch(:isSaldos, 0),0)
    render json: { data: Pro::DataImport.buscar_movimientos(ejercicio_fiscal, mes_id, tipo_movimiento_id, is_saldos) }
  end

  # GET /saldos_movimientos
  def saldos_movimientos
    ejercicio_fiscal_id = Integer(params.fetch(:ejercicioFiscalId, 0))
    mes_id = Integer(params.fetch(:mesId, 0))
    p "Buscando saldo_movimientos en el mes #{mes_id}"
    render json: { data: Pro::DataImport.buscar_saldos_movimientos(ejercicio_fiscal_id, mes_id) }
  end

  # GET /saldos_cuentas
  def saldos_cuentas
    ejercicio_fiscal_id = Integer(params.fetch(:ejercicioFiscalId, 0),0)
    mes_id = Integer(params.fetch(:mesId,0))
    is_saldos = Integer(params.fetch(:isSaldos,0))
    render json: { data: Pro::DataImport.buscar_saldos_cuentas(ejercicio_fiscal_id, mes_id, is_saldos) }
  end

  # GET /saldos_finales
  def saldos_finales
    ejercicio_fiscal_id = Integer(params.fetch(:ejercicioFiscalId, 0),0)
    mes_id = Integer(params.fetch(:mesId,0))
    render json: { data: Pro::DataImport.pa_saldos_finales(ejercicio_fiscal_id, mes_id) }
  end

  # GET /registros/1
  def show
    render json: @registro
  end

  # GET /to_excel
  def excel_example
    Axlsx::Package.new do |obj|
      obj.workbook.add_worksheet(name: "Sheet Name") do |sheet|
        sheet.add_row ["Simple Pie Chart"]
        %w[first second third].each { |label| sheet.add_row [label, rand(1..24)] }
        sheet.add_chart(
          Axlsx::Pie3DChart,
          start_at: [0,5],
          end_at: [10, 20],
          title: "example 3: Pie Chart"
        ) do |chart|
          chart.add_series data: sheet["B2:B4"], labels: sheet["A2:A4"], colors: ['FF0000', '00FF00', '0000FF']
        end
      end
      send_data obj.to_stream.read, type: "application/xlsx", filename: 'filename.xlsx'
    end
  end

  # POST /registros
  def create
    ActiveRecord::Base.transaction do
      @registro = Registro.new(registro_params)

      if @registro.save
        update_account_balance registro.cuenta.id
        render json: @registro, status: :created, location: @registro
      else
        render json: @registro.errors, status: :unprocessable_entity
      end
    rescue StandardError => e
      puts e
      raise e
    end
  end

  # PATCH/PUT /registros/1
  def update
    ActiveRecord::Base.transaction do
      if @registro.update(registro_params)
        update_account_balance registro.cuenta.id
        render json: @registro
      else
        render json: @registro.errors, status: :unprocessable_entity
      end
    rescue StandardError => e
      puts e
      raise e
    end
  end

  # DELETE /registros/1
  def destroy
    @registro.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_registro
    @registro = Registro.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def registro_params
    params.require(:registro).permit(:estado_registro_id, :registrable_type, :registrable_id, :importe, :fecha)
  end
end
