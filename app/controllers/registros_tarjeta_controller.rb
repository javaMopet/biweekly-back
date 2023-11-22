# frozen_string_literal: true

class RegistrosTarjetaController < ApplicationController
  include UpdateAccountBalanceCredit
  include UpdateAccountBalance
  before_action :set_registro_tarjeta, only: %i[show update destroy]

  # GET /registros_tarjeta
  def index
    @registros_tarjeta = RegistroTarjeta.all

    render json: @registros_tarjeta
  end

  # GET /registros_tarjeta/1
  def show
    render json: @registro_tarjeta
  end

  # GET /saldo_tarjeta_credito
  # def saldo_tarjeta_credito
  #   fecha_final = params.fetch(:fechaFinal, '2023-06-12')
  #   cuenta_id = Integer(params.fetch(:cuentaId, 0))
  #   is_detalle = Integer(params.fetch(:isDetalle, 0))

  #   render json: { data: Pro::DataImport.saldo_tarjeta_credito(fecha_final, cuenta_id, is_detalle) }
  # end

  # POST /create_multiple_registros_tarjeta
  def create_multiple
    ActiveRecord::Base.transaction do
      listado = params.fetch(:lista_registros_tarjeta, [])
      retorno = []

      listado.each do |registro_param|
        p registro_param[:tipo_afectacion]
        registro_tarjeta = obtener_registro_tarjeta registro_param
        raise StandardError, registro_tarjeta.errors.full_messages unless registro_tarjeta.save

        retorno.push(registro_tarjeta)
      end

      update_account_balance_credit retorno[0].cuenta.id

      render json: { retorno: }, status: :ok
    rescue StandardError => e
      puts e
      raise e
    end
  end

  # POST /registros_tarjeta/create_pago
  def create_pago
    ActiveRecord::Base.transaction do
      listado = params.fetch(:lista_registros, [])
      fecha_fin = params.fetch(:fecha_fin, nil)
      cuenta_id = params.fetch(:cuenta_id, nil)
      retorno = []

      listado.each do |registro_param|
        registro_tarjeta = RegistroTarjeta.find(registro_param[:registro_id])

        registro = obtener_registro registro_param
        registro_tarjeta.registro = registro
        registro_tarjeta.estado_registro_tarjeta_id = 2
        raise StandardError, registro_tarjeta.errors.full_messages unless registro_tarjeta.save

        retorno.push(registro)
      end
      total = retorno.sum(&:importe) * -1

      registro_tarjeta_pago = create_registro_tarjeta_pago total, fecha_fin
      registro_tarjeta_pago.cuenta_id = cuenta_id
      raise StandardError, registro_tarjeta_pago.errors.full_messages unless registro_tarjeta_pago.save

      update_account_balance_credit registro_tarjeta_pago.cuenta.id
      update_account_balance retorno[0].cuenta.id

      render json: { retorno: }, status: :ok
    # rescue ActiveRecord::RecordInvalid => e
    rescue StandardError => e
      puts e
      raise e
    end
  end

  # DELETE /registros_tarjeta/1
  def destroy
    @registro_tarjeta.destroy
  end

  private

  def obtener_registro_tarjeta(registro_param)
    registro_tarjeta = RegistroTarjeta.new

    registro_tarjeta.estado_registro_tarjeta_id = registro_param[:estado_registro_tarjeta_id]
    registro_tarjeta.cuenta_id = registro_param[:cuenta_id]
    registro_tarjeta.categoria_id = registro_param[:categoria_id]
    registro_tarjeta.tipo_afectacion = registro_param[:tipo_afectacion]
    registro_tarjeta.importe = registro_param[:importe]
    registro_tarjeta.fecha = registro_param[:fecha]
    registro_tarjeta.concepto = registro_param[:concepto]

    registro_tarjeta
  end

  def obtener_registro(registro_param)
    registro = Registro.new
    registro.estado_registro_id = registro_param[:estado_registro_id]
    registro.tipo_afectacion = registro_param[:tipo_afectacion]
    registro.importe = registro_param[:importe]
    registro.fecha = registro_param[:fecha]
    registro.categoria_id = registro_param[:categoria_id]
    registro.observaciones = registro_param[:observaciones]
    registro.cuenta_id = registro_param[:cuenta_id]
    registro.user_id = registro_param[:user_id]
    raise StandardError, registro.errors.full_messages unless registro.save

    registro
  end

  def create_registro_tarjeta_pago(total, fecha_fin)
    registro_tarjeta = RegistroTarjeta.new
    registro_tarjeta.estado_registro_tarjeta_id = 2
    registro_tarjeta.categoria_id = nil
    registro_tarjeta.tipo_afectacion = "A"
    registro_tarjeta.importe = total
    registro_tarjeta.fecha = fecha_fin
    registro_tarjeta.concepto = 'Pago del mes'
    registro_tarjeta.registro = nil
    registro_tarjeta.is_msi = false
    registro_tarjeta.numero_msi = 0

    registro_tarjeta
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_registro_tarjeta
    @registro_tarjeta = RegistroTarjeta.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def registro_tarjeta_params
    params.require(:registro_tarjeta).permit(
      :estado_registro_tarjeta_id,
      :cuenta_id,
      :importe,
      :fecha,
      :concepto,
      :is_msi,
      :numero_msi
    )
  end
end
