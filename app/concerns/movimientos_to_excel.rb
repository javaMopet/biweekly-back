module MovimientosToExcel
  extend ActiveSupport::Concern

  # Obtiene el reporte de movimientos y lo convierte a un archivo excel
  def movimientos_to_excel(ejercicio_fiscal_id, instance_id, _rows = nil)
    header_data = Pro::DataImport.pa_obtener_periodos(ejercicio_fiscal_id, 1)
    data_rows = Pro::DataImport.pa_reporte_movimientos(ejercicio_fiscal_id, 1, instance_id)
    number_total_elements = data_rows.size

    header_row = ['', 'Week Beginning']
    header_data.each do |d|
      header_row.push(d[:nombre])
    end

    p = Axlsx::Package.new
    wb = p.workbook
    s = wb.styles

    currency = s.add_style format_code: '#,##0.00'
    wrap_text = s.add_style alignment: { wrap_text: true }
    vertical_center = s.add_style alignment: { vertical: :center }

    wb.add_worksheet(name: "Biweekly #{ejercicio_fiscal_id}") do |sheet|
      sheet.add_row ['Biweekly Estimated Collections & Disbursements'], height: 35, style: vertical_center
      sheet.add_row header_row, height: 30, style: wrap_text

      data_rows.each do |obj|
        sheet.add_row obj.values, style: [nil] + Array.new(24) { currency }
      end

      sheet_add_styles_report(sheet, ejercicio_fiscal_id, instance_id, number_total_elements)
    end

    p.to_stream
  end

  # Agregar estilos al reporte
  def sheet_add_styles_report(sheet, ejercicio_fiscal_id, instance_id, number_total_elements)
    numero_ingresos = obtener_conteo_total_categorias(1, ejercicio_fiscal_id, instance_id)
    numero_egresos = obtener_conteo_total_categorias(2, ejercicio_fiscal_id, instance_id)

    number = numero_ingresos + 3
    number_egresos_inicio = number + 3
    number_egresos_fin = number_egresos_inicio + numero_egresos - 1

    # Estilo del titulo del reporte
    sheet.add_style ["A1"], fg_color: "3400dc", b: true
    # Background color del header (periodos)
    sheet.add_style "B2:Z2", bg_color: "deedd3"
    # Estilos del Collections
    sheet.add_style "A3:Y3", b: true, alignment: { horizontal: :center }
    # sheet.add_style "A3:Y3"
    # Background del total collections
    sheet.add_style "B#{number + 1}:Z#{number + 1}", bg_color: "e3e7f3", b: true
    # Disbursements title
    # sheet.add_style "A#{number + 2}:Y#{number + 2}"
    sheet.add_style "A#{number + 2}:Y#{number + 2}", b: true, alignment: { horizontal: :center }
    # para el background de los egresos
    # sheet.add_style "A#{number_egresos_inicio}:A#{number_egresos_fin}", bg_color: "aeb8d4"
    # Background del total disbursements
    sheet.add_style "B#{number_egresos_fin + 1}:Z#{number_egresos_fin + 1}", bg_color: "e3e7f3", b: true
    # Background del total netcash proceeds
    sheet.add_style "B#{number_egresos_fin + 2}:Z#{number_egresos_fin + 2}", bg_color: "c8d3f2", b: true
    # Background del total final cash balance
    sheet.add_style "B#{number_egresos_fin + 3}:Z#{number_egresos_fin + 3}", bg_color: "f3c5f1"
    # para el background de las cuentas de banco y efectivo
    # sheet.add_style "A#{number_egresos_fin + 4}:A#{number_total_elements}", bg_color: "aeb8d4"
    # Background del Total Cash banck account
    sheet.add_style "B#{number_total_elements + 1}:Z#{number_total_elements + 1}", bg_color: "f3c5f1"
    # Background del Net Balance
    sheet.add_style "B#{number_total_elements + 2}:Z#{number_total_elements + 2}", bg_color: "f7f2d4", b: true
    # Ancho de columnas
    # Define los anchos de columna base
    column_widths_base = [5] + [30] + Array.new(23, 15)
    sheet.column_widths(*column_widths_base)
  end

  # Obtiene el conteo de INGRESOS o EGRESOS dependiendo del ejercicio fiscal y la instancia
  def obtener_conteo_total_categorias(tipo_movimiento_id, ejercicio_fiscal_id, instance_id)
    Categoria.joins(:registros)
             .where('categorias.tipo_movimiento_id = ? AND YEAR(registros.fecha) = ? and categorias.instance_id = ?',
                    tipo_movimiento_id,
                    ejercicio_fiscal_id,
                    instance_id)
             .group('categorias.id')
             .pluck('categorias.id').count
  end
end
