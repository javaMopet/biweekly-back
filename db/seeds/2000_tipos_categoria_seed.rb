begin
  ActiveRecord::Base.connection.execute('DELETE FROM menus RESTART IDENTITY CASCADE')  
rescue StandardError => e
  puts 'No postgresql'
end

begin
  ActiveRecord::Base.connection.execute('DELETE FROM tipos_categoria; 
    DECLARE @reseed tinyint = IIF(@@ROWCOUNT > 0, 0, 1);
    DBCC CHECKIDENT (tipos_categoria, RESEED, @reseed);    
    ') # sqlserver
rescue StandardError => e
  p e.message
  puts 'No sqlserver'
end

TipoCategoria.create!(nombre: 'Ingreso', tipo_afectacion: 'A')
TipoCategoria.create!(nombre: 'Gasto', tipo_afectacion: 'C')
