class DetallesRegistroController < ApplicationController
  before_action :set_detall_registro, only: %i[ show update destroy ]

  # GET /detalles_registro
  def index
    @detalles_registro = DetalleRegistro.all

    render json: @detalles_registro
  end

  # GET /detalles_registro/1
  def show
    render json: @detall_registro
  end

  # POST /detalles_registro
  def create
    @detall_registro = DetalleRegistro.new(detall_registro_params)

    if @detall_registro.save
      render json: @detall_registro, status: :created, location: @detall_registro
    else
      render json: @detall_registro.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /detalles_registro/1
  def update
    if @detall_registro.update(detall_registro_params)
      render json: @detall_registro
    else
      render json: @detall_registro.errors, status: :unprocessable_entity
    end
  end

  # DELETE /detalles_registro/1
  def destroy
    @detall_registro.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detall_registro
      @detall_registro = DetalleRegistro.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def detall_registro_params
      params.require(:detall_registro).permit(:registro_id, :registrable_type, :registrable_id, :observaciones, :tipo_afectacion, :cuenta_contable_id, :importe_absoluto, :importe_real)
    end
end
