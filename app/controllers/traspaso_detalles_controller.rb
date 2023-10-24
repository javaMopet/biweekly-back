class TraspasoDetallesController < ApplicationController
  before_action :set_traspaso_detalle, only: %i[ show update destroy ]

  # GET /traspaso_detalles
  def index
    @traspaso_detalles = TraspasoDetalle.all

    render json: @traspaso_detalles
  end

  # GET /traspaso_detalles/1
  def show
    render json: @traspaso_detalle
  end

  # POST /traspaso_detalles
  def create
    @traspaso_detalle = TraspasoDetalle.new(traspaso_detalle_params)

    if @traspaso_detalle.save
      render json: @traspaso_detalle, status: :created, location: @traspaso_detalle
    else
      render json: @traspaso_detalle.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /traspaso_detalles/1
  def update
    if @traspaso_detalle.update(traspaso_detalle_params)
      render json: @traspaso_detalle
    else
      render json: @traspaso_detalle.errors, status: :unprocessable_entity
    end
  end

  # DELETE /traspaso_detalles/1
  def destroy
    @traspaso_detalle.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_traspaso_detalle
      @traspaso_detalle = TraspasoDetalle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def traspaso_detalle_params
      params.require(:traspaso_detalle).permit(:traspaso_id, :cuenta_id, :tipo_cuenta_trasferencia_id, :importe)
    end
end
