class TiposMovimientoController < ApplicationController
  before_action :set_tipo_movimiento, only: %i[ show update destroy ]

  # GET /tipos_movimiento
  def index
    @tipos_movimiento = TipoMovimiento.all

    render json: @tipos_movimiento
  end

  # GET /tipos_movimiento/1
  def show
    render json: @tipo_movimiento
  end

  # POST /tipos_movimiento
  def create
    @tipo_movimiento = TipoMovimiento.new(tipo_movimiento_params)

    if @tipo_movimiento.save
      render json: @tipo_movimiento, status: :created, location: @tipo_movimiento
    else
      render json: @tipo_movimiento.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tipos_movimiento/1
  def update
    if @tipo_movimiento.update(tipo_movimiento_params)
      render json: @tipo_movimiento
    else
      render json: @tipo_movimiento.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tipos_movimiento/1
  def destroy
    @tipo_movimiento.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_movimiento
      @tipo_movimiento = TipoMovimiento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tipo_movimiento_params
      params.require(:tipo_movimiento).permit(:nombre)
    end
end
