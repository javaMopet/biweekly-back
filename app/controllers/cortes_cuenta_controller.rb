class CortesCuentaController < ApplicationController
  before_action :set_corte_cuenta, only: %i[ show update destroy ]

  # GET /cortes_cuenta
  def index
    @cortes_cuenta = CorteCuenta.all

    render json: @cortes_cuenta
  end

  # GET /cortes_cuenta/1
  def show
    render json: @corte_cuenta
  end

  # POST /cortes_cuenta
  def create
    @corte_cuenta = CorteCuenta.new(corte_cuenta_params)

    if @corte_cuenta.save
      render json: @corte_cuenta, status: :created, location: @corte_cuenta
    else
      render json: @corte_cuenta.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cortes_cuenta/1
  def update
    if @corte_cuenta.update(corte_cuenta_params)
      render json: @corte_cuenta
    else
      render json: @corte_cuenta.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cortes_cuenta/1
  def destroy
    @corte_cuenta.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_corte_cuenta
      @corte_cuenta = CorteCuenta.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def corte_cuenta_params
      params.require(:corte_cuenta).permit(:saldo_inicial, :saldo_final, :fecha_inicial, :fecha_final, :estatus)
    end
end
