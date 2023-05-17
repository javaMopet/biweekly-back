class RegistrosTarjetaController < ApplicationController
  before_action :set_registro_tarjeta, only: %i[ show update destroy ]

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
    # Use callbacks to share common setup or constraints between actions.
    def set_registro_tarjeta
      @registro_tarjeta = RegistroTarjeta.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def registro_tarjeta_params
      params.require(:registro_tarjeta).permit(:fecha, :concepto, :categoria_id, :importe)
    end
end
