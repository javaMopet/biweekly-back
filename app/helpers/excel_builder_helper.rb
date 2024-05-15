require 'axlsx'

module ExcelBuilderHelper
  # prueba de generacion del excel
  def build_xls_template(users, rows = nil)
    # p users
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
    # p.serialize(file = prepare_file('my_template').path)
    # file
  end

  # def prepare_file(file_name)
  #   Tempfile.new([file_name, '.xlsx'], encoding: 'ascii-8bit')
  # end
end
