class EstadosMovimientoController < ApplicationController
  before_action :set_estado_movimiento, only: %i[ show update destroy ]

  # GET /estados_movimiento
  def index
    @estados_movimiento = EstadoMovimiento.all

    render json: @estados_movimiento
  end

  # GET /estados_movimiento/1
  def show
    render json: @estado_movimiento
  end

  # POST /estados_movimiento
  def create
    @estado_movimiento = EstadoMovimiento.new(estado_movimiento_params)

    if @estado_movimiento.save
      render json: @estado_movimiento, status: :created, location: @estado_movimiento
    else
      render json: @estado_movimiento.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /estados_movimiento/1
  def update
    if @estado_movimiento.update(estado_movimiento_params)
      render json: @estado_movimiento
    else
      render json: @estado_movimiento.errors, status: :unprocessable_entity
    end
  end

  # DELETE /estados_movimiento/1
  def destroy
    @estado_movimiento.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estado_movimiento
      @estado_movimiento = EstadoMovimiento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def estado_movimiento_params
      params.require(:estado_movimiento).permit(:nombre)
    end
end
