# frozen_string_literal: true

# begin
#   ActiveRecord::Base.connection.execute('DELETE FROM estados_registro RESTART IDENTITY CASCADE')
# rescue StandardError => e
#   puts "No postgresql #{e.message}"
# end

begin
  ActiveRecord::Base.connection.execute('DELETE FROM estados_registro;
    DECLARE @reseed tinyint = IIF(@@ROWCOUNT > 0, 0, 1);
    DBCC CHECKIDENT (estados_registro, RESEED, @reseed);
    ') # sqlserver
rescue StandardError => e
  p e.message
  puts 'No sqlserver'
end

EstadoRegistro.create!(nombre: 'Abierto')
EstadoRegistro.create!(nombre: 'Cerrado')
EstadoRegistro.create!(nombre: 'Cancelado')
