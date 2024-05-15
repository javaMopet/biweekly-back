module MovimientosExcelBuilderHelper
  # generar archivo en excel de movimientos
  def movimientos_to_excel(ejercicio_fiscal_id, rows = nil)
    p ejercicio_fiscal_id
    users = User.all
    categorias = Categoria.all
    p = Axlsx::Package.new
    wb = p.workbook
    rows ||= ['First', 'Second', 'Third']

    wb.add_worksheet(name: 'My Form') do |sheet|
      sheet.add_row rows
      users.each do |u|
        row = []
        row[0] = u.id
        row[1] = u.name
        row[2] = u.uid
        sheet.add_row row
      end

      categorias.each do |c|
        row = []
        row[0] = c.id
        row[1] = c.nombre
        sheet.add_row row
      end

      sheet.add_style "A2:C2", bg_color: "95AFBA"
    end

    p.to_stream
  end
end
