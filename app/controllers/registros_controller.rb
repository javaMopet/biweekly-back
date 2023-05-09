# frozen_string_literal: true

# Controlador para registros
class RegistrosController < ApplicationController
  before_action :set_registro, only: %i[show update destroy]

  # GET /registros
  def index
    @registros = Registro.all

    render json: @registros
  end

  # GET /movimientos
  def movimientos
    render json: { data: Pro::DataImport
      .buscar_movimientos(2023,
                          params.fetch(:tipoMovimientoId,
                                       0).to_i,
                          params.fetch(:isSaldos,
                                       0).to_i) }
  end

  # GET /saldos_movimientos
  def saldos_movimientos
    ejercicio_fiscal_id = params.fetch(:ejercicio_fiscal_id, 0).to_i

    render json: { data: Pro::DataImport.buscar_saldos_movimientos(2023, 4, 1) }
  end

  # GET /saldos_cuentas
  def saldos_cuentas
    ejercicio_fiscal_id = params.fetch(:ejercicio_fiscal_id, 0).to_i
    p ejercicio_fiscal_id
    render json: { data: Pro::DataImport
      .buscar_saldos_cuentas(2023,
                             params.fetch(:isSaldos, 0).to_i) }
  end

  # GET /saldos_finales
  def saldos_finales
    render json: { data: Pro::DataImport.buscar_saldos_finales(2023) }
  end

  # GET /columnas
  def columnas
    render json: { data: Pro::DataImport.buscar_columnas(2023) }
  end

  # GET /registros/1
  def show
    render json: @registro
  end

  # POST /registros
  def create
    @registro = Registro.new(registro_params)

    if @registro.save
      render json: @registro, status: :created, location: @registro
    else
      render json: @registro.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /registros/1
  def update
    if @registro.update(registro_params)
      render json: @registro
    else
      render json: @registro.errors, status: :unprocessable_entity
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
    params.require(:registro).permit(:estado_registro_id, :registrable_type, :registrable_id,
                                     :importe, :fecha)
  end
end
