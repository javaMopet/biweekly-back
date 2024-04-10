# frozen_string_literal: true

# begin
#   ActiveRecord::Base.connection.execute('DELETE FROM bancos RESTART IDENTITY CASCADE')
# rescue StandardError => e
#   puts "No postgresql database #{e.message}"
# end

begin
  # sqlserver
  ActiveRecord::Base.connection.execute(
    '
    DELETE FROM bancos;
    DECLARE @reseed tinyint = IIF(@@ROWCOUNT > 0, 0, 0);
    DBCC CHECKIDENT (bancos, RESEED, @reseed);
    '
  )
rescue StandardError => e
  puts "No sqlserver #{e.message}"
end

Banco.create!(nombre: 'Santander', icono: 'santander1.png')
Banco.create!(nombre: 'Bancomer', icono: 'bancomer1.png')
Banco.create!(nombre: 'Scotiabank', icono: 'scotiabank1.png')
Banco.create!(nombre: 'Banco Azteca', icono: 'aztecabank1.png')
Banco.create!(nombre: 'Banamex', icono: 'banamex1.png')
Banco.create!(nombre: 'American Express', icono: 'amex1.png')
