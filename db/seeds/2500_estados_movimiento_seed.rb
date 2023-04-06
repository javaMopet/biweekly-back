# frozen_string_literal: true

# begin
#   ActiveRecord::Base.connection.execute('DELETE FROM estados_movimiento RESTART IDENTITY CASCADE')
# rescue StandardError => e
#   puts "No postgresql #{e.message}"
# end

begin
  ActiveRecord::Base.connection.execute('DELETE FROM estados_movimiento;
    DECLARE @reseed tinyint = IIF(@@ROWCOUNT > 0, 0, 1);
    DBCC CHECKIDENT (estados_movimiento, RESEED, @reseed);
    ') # sqlserver
rescue StandardError => e
  p e.message
  puts 'No sqlserver'
end

EstadoMovimiento.create!(nombre: 'Abierto')
EstadoMovimiento.create!(nombre: 'Cerrado')
EstadoMovimiento.create!(nombre: 'Cancelado')
