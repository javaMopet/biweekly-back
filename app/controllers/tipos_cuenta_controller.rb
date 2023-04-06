class TiposCuentaController < ApplicationController
  before_action :set_tipo_cuenta, only: %i[ show update destroy ]

  # GET /tipos_cuenta
  def index
    @tipos_cuenta = TipoCuenta.all

    render json: @tipos_cuenta
  end

  # GET /tipos_cuenta/1
  def show
    render json: @tipo_cuenta
  end

  # POST /tipos_cuenta
  def create
    @tipo_cuenta = TipoCuenta.new(tipo_cuenta_params)

    if @tipo_cuenta.save
      render json: @tipo_cuenta, status: :created, location: @tipo_cuenta
    else
      render json: @tipo_cuenta.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tipos_cuenta/1
  def update
    if @tipo_cuenta.update(tipo_cuenta_params)
      render json: @tipo_cuenta
    else
      render json: @tipo_cuenta.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tipos_cuenta/1
  def destroy
    @tipo_cuenta.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_cuenta
      @tipo_cuenta = TipoCuenta.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tipo_cuenta_params
      params.require(:tipo_cuenta).permit(:nombre)
    end
end
