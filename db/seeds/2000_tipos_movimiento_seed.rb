# frozen_string_literal: true

# begin
#   ActiveRecord::Base.connection.execute('DELETE FROM tipos_movimiento RESTART IDENTITY CASCADE')
# rescue StandardError => e
#   puts "No postgresql #{e.message}"
# end

begin
  ActiveRecord::Base.connection.execute('
  DELETE FROM movimientos;
    DECLARE @reseedm tinyint = IIF(@@ROWCOUNT > 0, 0, 1);
    DBCC CHECKIDENT (movimientos, RESEED, @reseedm);
  DELETE FROM tipos_movimiento;
    DECLARE @reseed tinyint = IIF(@@ROWCOUNT > 0, 0, 1);
    DBCC CHECKIDENT (tipos_movimiento, RESEED, @reseed);
    ') # sqlserver
rescue StandardError => e
  p e.message
  puts 'No sqlserver'
end

TipoMovimiento.create!(nombre: 'Ingreso', icono: 'fa-solid fa-hand-holding-dollar')
TipoMovimiento.create!(nombre: 'Gasto', icono: 'fa-solid fa-file-invoice-dollar')
TipoMovimiento.create!(nombre: 'Transferencia', icono: 'sync_alt')
