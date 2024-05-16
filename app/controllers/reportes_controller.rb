# require_relative '../models/ar/template_builder_logic'

class ReportesController < ApplicationController
  include ReporteTotalesCategoriaHelper

  # GET /totales_por_categoria
  def totales_por_categoria
    ejercicio_fiscal_id = Integer(params.fetch(:ejercicioFiscalId, 0))
    mes_id = Integer(params.fetch(:mesId, 0))

    p ejercicio_fiscal_id
    p "mes_id: #{mes_id}"

    send_data(
      totales_por_categoria(ejercicio_fiscal_id, instance_id).read,
      type: 'application/vnd.ms-excel',
      disposition: 'attachment',
      filename: 'totalesPorCategoria.xlsx'
    )
  end
end
