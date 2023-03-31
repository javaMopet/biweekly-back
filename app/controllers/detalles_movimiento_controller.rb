class DetallesMovimientoController < ApplicationController
  before_action :set_detalle_movimiento, only: %i[ show update destroy ]

  # GET /detalles_movimiento
  def index
    @detalles_movimiento = DetalleMovimiento.all

    render json: @detalles_movimiento
  end

  # GET /detalles_movimiento/1
  def show
    render json: @detalle_movimiento
  end

  # POST /detalles_movimiento
  def create
    @detalle_movimiento = DetalleMovimiento.new(detalle_movimiento_params)

    if @detalle_movimiento.save
      render json: @detalle_movimiento, status: :created, location: @detalle_movimiento
    else
      render json: @detalle_movimiento.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /detalles_movimiento/1
  def update
    if @detalle_movimiento.update(detalle_movimiento_params)
      render json: @detalle_movimiento
    else
      render json: @detalle_movimiento.errors, status: :unprocessable_entity
    end
  end

  # DELETE /detalles_movimiento/1
  def destroy
    @detalle_movimiento.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detalle_movimiento
      @detalle_movimiento = DetalleMovimiento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def detalle_movimiento_params
      params.require(:detalle_movimiento).permit(:movimiento_id, :categoria_id, :cuenta_id, :importe, :tipo_afectacion, :cuenta_contable_categoria_id, :cuenta_contable_banco_id)
    end
end
