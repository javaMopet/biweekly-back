# require_relative '../models/ar/template_builder_logic'

class ReportesController < ApplicationController
  include ReporteExcel
  before_action :authenticate_user_from_token!

  # GET /totales_por_categoria
  def totales_por_categoria
    ejercicio_fiscal_id = Integer(params.fetch(:ejercicioFiscalId, 2024))
    instance_id = current_user.instance_id

    results = Categoria.joins(:registros)
                       .select('categorias.nombre, SUM(registros.importe) AS importe')
                       .where('YEAR(registros.fecha) = ?', ejercicio_fiscal_id)
                       .where('categorias.instance_id = ?', instance_id)
                       .group('categorias.id, categorias.tipo_movimiento_id, categorias.nombre, categorias.orden')
                       .order('categorias.tipo_movimiento_id, categorias.orden')

    p results.as_json
    render json: { data: results.as_json }
    # send_data(
    #   ReporteExcel.totales_por_categoria(results.as_json).read,
    #   type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
    #   disposition: 'attachment',
    #   filename: 'totalesPorCategoria.xlsx'
    # )
  rescue StandardError => e
    p e
  end
end
