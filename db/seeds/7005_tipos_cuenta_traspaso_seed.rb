# frozen_string_literal: true

# begin
#   ActiveRecord::Base.connection.execute('DELETE FROM tipos_cuenta_traspaso RESTART IDENTITY CASCADE')
# rescue StandardError => e
#   puts "No postgresql #{e.message}"
# end

begin
  ActiveRecord::Base.connection.execute('DELETE FROM tipos_cuenta_traspaso;
    DECLARE @reseed tinyint = IIF(@@ROWCOUNT > 0, 0, 1);
    DBCC CHECKIDENT (tipos_cuenta_traspaso, RESEED, @reseed);
    ') # sqlserver
rescue StandardError => e
  p e.message
  puts 'No sqlserver'
end

TipoCuentaTraspaso.create!(nombre: 'Entrada')
TipoCuentaTraspaso.create!(nombre: 'Salida')