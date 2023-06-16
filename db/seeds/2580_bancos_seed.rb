# frozen_string_literal: true

# begin
#   ActiveRecord::Base.connection.execute('DELETE FROM bancos RESTART IDENTITY CASCADE')
# rescue StandardError => e
#   puts "No postgresql database #{e.message}"
# end

begin
  ActiveRecord::Base.connection.execute('
  DELETE FROM bancos;
    DECLARE @reseed tinyint = IIF(@@ROWCOUNT > 0, 0, 1);
    DBCC CHECKIDENT (bancos, RESEED, @reseed);
    ') # sqlserver
rescue StandardError => e
  puts "No sqlserver #{e.message}"
end

Banco.create!(nombre: 'Santander', icono: 'santander.png')
Banco.create!(nombre: 'Bancomer', icono: 'bancomer.png')
Banco.create!(nombre: 'Scotiabank', icono: 'scotiabank.png')
Banco.create!(nombre: 'Banco Azteca', icono: 'bazteca.png')
Banco.create!(nombre: 'Banamex', icono: 'banamex.png')
