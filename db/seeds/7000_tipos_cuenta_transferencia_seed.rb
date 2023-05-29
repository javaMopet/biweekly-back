# frozen_string_literal: true

# begin
#   ActiveRecord::Base.connection.execute('DELETE FROM tipos_cuenta_transferencia RESTART IDENTITY CASCADE')
# rescue StandardError => e
#   puts "No postgresql #{e.message}"
# end

begin
  ActiveRecord::Base.connection.execute('DELETE FROM tipos_cuenta_transferencia;
    DECLARE @reseed tinyint = IIF(@@ROWCOUNT > 0, 0, 1);
    DBCC CHECKIDENT (tipos_cuenta_transferencia, RESEED, @reseed);
    ') # sqlserver
rescue StandardError => e
  p e.message
  puts 'No sqlserver'
end

TipoCuentaTransferencia.create!(nombre: 'Entrada')
TipoCuentaTransferencia.create!(nombre: 'Salida')
