# require_relative '../models/ar/template_builder_logic'

class ReportesController < ApplicationController
  include GraphqlDevise::SetUserByToken
  include ReporteExcel

  before_action -> { set_resource_by_token(User) }

  # GET /totales_por_categoria
  def totales_por_categoria
    context = gql_devise_context(User)

    p "Usuario: #{context[:current_resource].uid}"
    p "Instance: #{context[:current_resource].instance_id}"
    p context
    p context[:current_resource]

    # mandar en los headers access_token, client, uid

    # result = BiweeklyBackSchema.execute(params[:query], context: gql_devise_context(User))
    # render json: result unless performed?
    # p result

    ejercicio_fiscal_id = Integer(params.fetch(:ejercicioFiscalId, 2024))
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

    # send_data(
    #   ReporteExcel.totales_por_categoria(results.as_json).read,
    #   type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
    #   disposition: 'attachment',
    #   filename: 'totalesPorCategoria.xlsx'
    # )
  end
end
