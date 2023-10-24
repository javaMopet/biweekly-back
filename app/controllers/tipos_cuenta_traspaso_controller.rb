class TiposCuentaTraspasoController < ApplicationController
  before_action :set_tipo_cuenta_traspaso, only: %i[ show update destroy ]

  # GET /tipos_cuenta_traspaso
  def index
    @tipos_cuenta_traspaso = TipoCuentaTraspaso.all

    render json: @tipos_cuenta_traspaso
  end

  # GET /tipos_cuenta_traspaso/1
  def show
    render json: @tipo_cuenta_traspaso
  end

  # POST /tipos_cuenta_traspaso
  def create
    @tipo_cuenta_traspaso = TipoCuentaTraspaso.new(tipo_cuenta_traspaso_params)

    if @tipo_cuenta_traspaso.save
      render json: @tipo_cuenta_traspaso, status: :created, location: @tipo_cuenta_traspaso
    else
      render json: @tipo_cuenta_traspaso.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tipos_cuenta_traspaso/1
  def update
    if @tipo_cuenta_traspaso.update(tipo_cuenta_traspaso_params)
      render json: @tipo_cuenta_traspaso
    else
      render json: @tipo_cuenta_traspaso.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tipos_cuenta_traspaso/1
  def destroy
    @tipo_cuenta_traspaso.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_cuenta_traspaso
      @tipo_cuenta_traspaso = TipoCuentaTraspaso.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tipo_cuenta_traspaso_params
      params.require(:tipo_cuenta_traspaso).permit(:nombre)
    end
end
