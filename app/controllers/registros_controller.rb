# frozen_string_literal: true

# Controlador para registros
class RegistrosController < ApplicationController
  include UpdateAccountBalance
  before_action :set_registro, only: %i[show update destroy]

  # GET /registros
  def index
    @registros = Registro.all

    render json: @registros
  end

  # GET /columnas
  def columnas
    ejercicio_fiscal = params.fetch(:ejercicio_fiscal,0).to_i
    mes = Integer(params.fetch(:mes, 0))
    render json: { data: Pro::DataImport.buscar_columnas(ejercicio_fiscal, mes) }
  end

  # GET /movimientos
  def movimientos
    tipo_movimiento_id = Integer(params.fetch(:tipoMovimientoId, 0),0)
    is_saldos = Integer(params.fetch(:isSaldos, 0),0)
    render json: { data: Pro::DataImport.buscar_movimientos(2023, tipo_movimiento_id, is_saldos) }

  end

  # GET /saldos_movimientos
  def saldos_movimientos
    ejercicio_fiscal_id = Integer(params.fetch(:ejercicio_fiscal_id, 0))

    render json: { data: Pro::DataImport.buscar_saldos_movimientos(2023, 4, 1) }
  end

  # GET /saldos_cuentas
  def saldos_cuentas
    ejercicio_fiscal_id = Integer(params.fetch(:ejercicio_fiscal_id, 0),0)
    p ejercicio_fiscal_id
    render json: { data: Pro::DataImport.buscar_saldos_cuentas(2023, params.fetch(:isSaldos, 0).to_i) }
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

  # POST /registros/create_multiple
  def create_multiple
    ActiveRecord::Base.transaction do
      listado = params.fetch(:lista_registros, [])
      retorno = []

      listado.each do |registro_param|
        registro = obtener_registro registro_param
        raise StandardError, registro.errors.full_messages unless registro.save

        retorno.push(registro)
      end

      update_account_balance retorno[0].cuenta.id

      render json: { retorno: }, status: :ok
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

  def obtener_registro(registro_param)
    registro = Registro.new
    registro.estado_registro_id = registro_param["estado_registro_id"]
    registro.tipo_afectacion = registro_param["tipo_afectacion"]
    registro.categoria_id = registro_param["categoria_id"]
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
    params.require(:registro).permit(:estado_registro_id, :registrable_type, :registrable_id, :importe, :fecha)
  end
end
