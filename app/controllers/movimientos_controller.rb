# frozen_string_literal: true

# Controlador para registros
class MovimientosController < ApplicationController
  include MovimientosToExcel
  before_action :authenticate_user_from_token!

  # exportar movimientos a excel
  def to_excel
    ejercicio_fiscal_id = Integer(params.fetch(:ejercicioFiscalId, 0))
    mes_id = Integer(params.fetch(:mesId, 0))
    instance_id = current_user.instance_id

    p "ejercicio_fiscal_id: #{ejercicio_fiscal_id}"
    p "mes_id: #{mes_id}"
    p "instance_id: #{instance_id}"

    send_data(
      movimientos_to_excel(ejercicio_fiscal_id, instance_id).read,
      type: 'application/vnd.ms-excel',
      disposition: 'attachment',
      filename: 'myfile.xlsx'
    )
  end
end
