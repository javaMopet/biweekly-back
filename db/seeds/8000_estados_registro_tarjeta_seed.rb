# frozen_string_literal: true

# begin
#   ActiveRecord::Base.connection.execute('DELETE FROM estados_registro_tarjeta RESTART IDENTITY CASCADE')
# rescue StandardError => e
#   puts "No postgresql #{e.message}"
# end

begin
  ActiveRecord::Base.connection.execute('DELETE FROM estados_registro_tarjeta;
    DECLARE @reseed tinyint = IIF(@@ROWCOUNT > 0, 0, 1);
    DBCC CHECKIDENT (estados_registro_tarjeta, RESEED, @reseed);
    ') # sqlserver
rescue StandardError => e
  p e.message
  puts 'No sqlserver'
end

EstadoRegistroTarjeta.create!(nombre: 'Pendiente')
EstadoRegistroTarjeta.create!(nombre: 'Cerrado')
EstadoRegistroTarjeta.create!(nombre: 'Cancelado')
