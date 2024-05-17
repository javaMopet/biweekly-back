# require_relative '../models/ar/template_builder_logic'

class ReportesController < ApplicationController
  include ReporteExcel

  # GET /totales_por_categoria
  def totales_por_categoria
    ejercicio_fiscal_id = 2024
    # Integer(params.fetch(:ejercicioFiscalId, 0))
    # mes_id = Integer(params.fetch(:mesId, 0))

    # p ejercicio_fiscal_id
    # p "mes_id: #{mes_id}"
    instance_id = 1

    results = Categoria.joins(:registros)
                       .select('categorias.nombre, SUM(registros.importe) AS importe')
                       .where('YEAR(registros.fecha) = ?', ejercicio_fiscal_id)
                       .where('categorias.instance_id = ?', instance_id)
                       .group('categorias.id, categorias.tipo_movimiento_id, categorias.nombre, categorias.orden')
                       .order('categorias.tipo_movimiento_id, categorias.orden')

    send_data(
      ReporteExcel.totales_por_categoria(results.as_json).read,
      type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
      disposition: 'attachment',
      filename: 'totalesPorCategoria.xlsx'
    )
  end
end
