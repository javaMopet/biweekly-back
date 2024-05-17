module ReporteExcel
  extend ActiveSupport::Concern

  # Genera el archivo excel de totales por categoria
  def self.totales_por_categoria(data)
    package = Axlsx::Package.new
    workbook = package.workbook
    workbook.add_worksheet(name: 'Data') do |sheet|
      sheet.add_row ['CATEGORIA', 'IMPORTE']
      data.each do |row|
        sheet.add_row(row.values)
      end
    end
    package.to_stream
  end
end
