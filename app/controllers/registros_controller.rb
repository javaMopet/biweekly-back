# frozen_string_literal: true

# Controlador para registros
class RegistrosController < ApplicationController
  before_action :set_registro, only: %i[show update destroy]

  # GET /registros
  def index
    @registros = Registro.all

    render json: @registros
  end

  # GET /columnas
  def columnas
    ejercicio_fiscal = params.fetch(:ejercicio_fiscal,0).to_i
    mes = params.fetch(:mes, 0).to_i
    render json: { data: Pro::DataImport.buscar_columnas(ejercicio_fiscal, mes) }
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

  # POST /registros/create_multiple
  def create_multiple
    listado = params.fetch(:lista_registros, [])
    retorno = []

    listado.each do |registro_param|
      p registro_param
      registro = nil
      if registro_param["tipoMovimientoId"] == 1
        p 'Ingreso'
        registro = obtener_ingreso registro_param
      else
        p 'Egreso'
        registro = obtener_egreso registro_param
      end
      registro.save
      # registro_tarjeta = obtener_registro registro_param
      # p registro_tarjeta.errors.full_messages unless registro_tarjeta.save

      retorno.push(registro)
    end

    render json: { retorno: }, status: :ok
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

  def obtener_ingreso(registro_param)
    registro = obtener_registro registro_param
    ingreso = Ingreso.new
    ingreso.categoria_id = registro_param["categoria_id"]
    registro.registrable = ingreso
    ingreso.registro = registro
    registro
  end

  def obtener_egreso(registro_param)
    registro = obtener_registro registro_param
    egreso = Egreso.new
    egreso.categoria_id = registro_param["categoria_id"]
    registro.registrable = egreso
    egreso.registro = registro
    registro
  end

  def obtener_registro(registro_param)
    registro = Registro.new
    registro.estado_registro_id = registro_param["estado_registro_id"]
    registro.importe = registro_param["importe"]
    registro.fecha = registro_param["fecha"]
    registro.cuenta_id = registro_param["cuenta_id"]
    registro.observaciones = registro_param["observaciones"]
    registro
  end

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
