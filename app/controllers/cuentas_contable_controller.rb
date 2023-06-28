class CuentasContableController < ApplicationController
  before_action :set_cuenta_contable, only: %i[show update destroy]

  # GET /cuentas_contable/1
  def show
    render json: @cuenta_contable
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cuenta_contable
    @cuenta_contable = CuentaContable.find(params[:id])
  end
end
