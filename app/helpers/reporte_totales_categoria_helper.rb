module ReporteTotalesCategoriaHelper
  # generar archivo en excel del reporte de totales por categoria
  def totales_por_categoria(ejercicio_fiscal_id, instance_id)
    @results = Categoria.joins(:registros)
                        .select('categorias.tipo_movimiento_id, categorias.nombre, SUM(registros.importe) AS importe')
                        .where('YEAR(registros.fecha) = ?', ejercicio_fiscal_id)
                        .where('categorias.instance_id = ?', instance_id)
                        .group('categorias.tipo_movimiento_id, categorias.nombre, categorias.orden')
                        .order('categorias.tipo_movimiento_id, categorias.orden')
  end
end
