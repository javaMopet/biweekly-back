class RegistrosTarjetaController < ApplicationController
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

  # POST /registros_tarjeta
  def create
    @registro_tarjeta = RegistroTarjeta.new(registro_tarjeta_params)

    if @registro_tarjeta.save
      render json: @registro_tarjeta, status: :created, location: @registro_tarjeta
    else
      render json: @registro_tarjeta.errors, status: :unprocessable_entity
    end
  end

  # POST /create_multiple_registros_tarjeta
  def create_multiple
    listado = params.fetch(:lista_registros_tarjeta, [])
    retorno = []

    listado.each do |registro_param|
      registro_tarjeta = obtener_registro registro_param
      p registro_tarjeta.errors.full_messages unless registro_tarjeta.save

      retorno.push(registro_tarjeta)
    end

    render json: { retorno: }, status: :ok
  end

  # PATCH/PUT /registros_tarjeta/1
  def update
    if @registro_tarjeta.update(registro_tarjeta_params)
      render json: @registro_tarjeta
    else
      render json: @registro_tarjeta.errors, status: :unprocessable_entity
    end
  end

  # DELETE /registros_tarjeta/1
  def destroy
    @registro_tarjeta.destroy
  end

  private

  def obtener_registro(registro_param)
    registro_tarjeta = RegistroTarjeta.new

    registro_tarjeta.estado_registro_tarjeta_id = registro_param[:estado_registro_tarjeta_id]
    registro_tarjeta.cuenta_id = registro_param[:cuenta_id]
    registro_tarjeta.categoria_id = registro_param[:categoria_id]
    registro_tarjeta.importe = registro_param[:importe]
    registro_tarjeta.fecha = registro_param[:fecha]
    registro_tarjeta.concepto = registro_param[:concepto]

    registro_tarjeta
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_registro_tarjeta
    @registro_tarjeta = RegistroTarjeta.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def registro_tarjeta_params
    params.require(:registro_tarjeta).permit(:estado_registro_tarjeta_id, :cuenta_id, :importe, :fecha, :concepto)
  end
end
