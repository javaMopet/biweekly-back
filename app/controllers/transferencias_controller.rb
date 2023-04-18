class TransferenciasController < ApplicationController
  before_action :set_transferencia, only: %i[ show update destroy ]

  # GET /transferencias
  def index
    @transferencias = Transferencia.all

    render json: @transferencias
  end

  # GET /transferencias/1
  def show
    render json: @transferencia
  end

  # POST /transferencias
  def create
    @transferencia = Transferencia.new(transferencia_params)

    if @transferencia.save
      render json: @transferencia, status: :created, location: @transferencia
    else
      render json: @transferencia.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /transferencias/1
  def update
    if @transferencia.update(transferencia_params)
      render json: @transferencia
    else
      render json: @transferencia.errors, status: :unprocessable_entity
    end
  end

  # DELETE /transferencias/1
  def destroy
    @transferencia.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transferencia
      @transferencia = Transferencia.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transferencia_params
      params.require(:transferencia).permit(:cuenta_origen_id, :cuenta_destino_id, :observaciones)
    end
end
