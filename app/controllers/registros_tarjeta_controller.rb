# frozen_string_literal: true

class RegistrosTarjetaController < ApplicationController
  include UpdateAccountBalanceCredit
  include UpdateAccountBalance
  before_action :set_registro_tarjeta, only: %i[show update destroy]
  before_action :authenticate_user_from_token!

  # POST /registros_tarjeta/create_pago
  def create_pago
    ActiveRecord::Base.transaction do
      listado = params.fetch(:lista_registros, [])
      _fecha_fin = params.fetch(:fecha_fin, nil)
      fecha_aplicacion = params.fetch(:fecha_aplicacion, nil)
      importe_total = params.fetch(:importe_total, 0)
      cuenta_id = params.fetch(:cuenta_id, nil)

      pago_tarjeta = crear_pago_tarjeta fecha_aplicacion, importe_total, cuenta_id

      retorno = crear_registros listado, pago_tarjeta.id

      total = retorno.sum(&:importe) * -1

      registro_tarjeta_pago = create_registro_tarjeta_pago total, fecha_aplicacion, pago_tarjeta.id, cuenta_id

      raise StandardError, registro_tarjeta_pago.errors.full_messages unless registro_tarjeta_pago.save

      update_account_balance_credit registro_tarjeta_pago.cuenta.id
      update_account_balance retorno.first.cuenta.id

      render json: { retorno: }, status: :ok
    # rescue ActiveRecord::RecordInvalid => e
    rescue StandardError => e
      puts e
      raise e
    end
  end

  private

  def crear_registros(listado, pago_tarjeta_id)
    retorno = []
    listado.each do |registro_param|
      registro_tarjeta = RegistroTarjeta.find(registro_param[:registro_id])
      raise StandardError, registro_tarjeta.errors.full_messages unless registro_tarjeta.update(
        estado_registro_tarjeta_id: 2, pago_tarjeta_id:, is_pago: false
      )

      registro = obtener_registro registro_param, registro_tarjeta
      retorno.push(registro)
    end
    retorno
  end

  def crear_pago_tarjeta(fecha_aplicacion, importe_total, cuenta_id)
    pago_tarjeta = PagoTarjeta.new
    pago_tarjeta.fecha = fecha_aplicacion
    pago_tarjeta.importe = importe_total
    pago_tarjeta.cuenta_id = cuenta_id
    pago_tarjeta.save
    pago_tarjeta
  end

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

  def obtener_registro(registro_param, registro_tarjeta)
    registro = Registro.new
    registro.estado_registro_id = registro_param[:estado_registro_id]
    registro.tipo_afectacion = registro_param[:tipo_afectacion]
    registro.importe = registro_param[:importe]
    registro.fecha = registro_param[:fecha]
    registro.categoria_id = registro_param[:categoria_id]
    registro.observaciones = registro_param[:observaciones]
    registro.cuenta_id = registro_param[:cuenta_id]
    registro.user_id = registro_param[:user_id]
    registro.registro_tarjeta_id = registro_tarjeta.id
    raise StandardError, registro.errors.full_messages unless registro.save

    registro
  end

  def create_registro_tarjeta_pago(total, fecha_fin, pago_tarjeta_id, cuenta_id)
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
    registro_tarjeta.pago_tarjeta_id = pago_tarjeta_id
    registro_tarjeta.cuenta_id = cuenta_id
    registro_tarjeta.is_pago = true

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
