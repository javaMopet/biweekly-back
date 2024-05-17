module MovimientosExcelBuilderHelper
  # generar archivo en excel de movimientos
  def movimientos_to_excel(ejercicio_fiscal_id, _rows = nil)
    header_data = Pro::DataImport.pa_obtener_periodos(ejercicio_fiscal_id, 1)
    data_rows = Pro::DataImport.pa_reporte_movimientos(ejercicio_fiscal_id, 1)

    header_row = ['', 'Week Beginning']
    header_data.each do |d|
      header_row.push(d[:nombre])
    end
    numero_ingresos = Categoria.joins(:registros)
                               .where('categorias.tipo_movimiento_id = ? AND YEAR(registros.fecha) = ?',
                                      1,
                                      ejercicio_fiscal_id)
                               .group('categorias.id')
                               .pluck('categorias.id').count
    numero_egresos = Categoria.joins(:registros)
                              .where('categorias.tipo_movimiento_id = ? AND YEAR(registros.fecha) = ?',
                                     2,
                                     ejercicio_fiscal_id)
                              .group('categorias.id')
                              .pluck('categorias.id').count

    number = numero_ingresos + 3
    number_egresos_inicio = number + 3
    number_egresos_fin = number_egresos_inicio + numero_egresos - 1
    number_total_elements = data_rows.size

    p = Axlsx::Package.new
    wb = p.workbook
    s = wb.styles

    currency = s.add_style format_code: '#,##0.00'
    wrap_text = s.add_style alignment: { wrap_text: true }
    vertical_center = s.add_style alignment: { vertical: :center }

    wb.add_worksheet(name: "Biweekly #{ejercicio_fiscal_id}") do |sheet|
      sheet.add_row ['Biweekly Estimated Collections & Disbursements'],
                    height: 35,
                    style: vertical_center
      sheet.add_row header_row, height: 30, style: wrap_text

      data_rows.each do |obj|
        sheet.add_row obj.values,
                      style: [
                        nil,
                        currency,
                        currency,
                        currency,
                        currency,
                        currency,
                        currency,
                        currency,
                        currency,
                        currency,
                        currency,
                        currency,
                        currency,
                        currency,
                        currency,
                        currency,
                        currency,
                        currency,
                        currency,
                        currency,
                        currency,
                        currency,
                        currency
                      ]
      end

      # Estilo del titulo del reporte
      sheet.add_style ["A1"], fg_color: "3400dc", b: true
      # Background color del header (periodos)
      sheet.add_style "B2:Z2", bg_color: "deedd3"
      # Estilos del Collections
      sheet.add_style "A3:Y3", b: true, alignment: { horizontal: :center }
      # sheet.add_style "A3:Y3"
      # para el background de los ingresos
      # sheet.add_style "A4:A#{number}", bg_color: "aeb8d4"
      # Background del total collections
      sheet.add_style "B#{number + 1}:Z#{number + 1}", bg_color: "e3e7f3", b: true
      # Disbursements title
      sheet.add_style "A#{number + 2}:Y#{number + 2}", b: true
      sheet.add_style "A#{number + 2}:Y#{number + 2}", alignment: { horizontal: :center }
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
      sheet.column_widths 7,
                          27,
                          15,
                          15,
                          15,
                          15,
                          15,
                          15,
                          15,
                          15,
                          15,
                          15,
                          15,
                          15,
                          15,
                          15,
                          15,
                          15,
                          15,
                          15,
                          15,
                          15,
                          15,
                          15,
                          15,
                          15
    end

    p.to_stream
  end
end
