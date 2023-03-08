begin
  ActiveRecord::Base.connection.execute('DELETE FROM categorias RESTART IDENTITY CASCADE')  
rescue StandardError => e
  puts 'No postgresql'
end

begin
  ActiveRecord::Base.connection.execute('DELETE FROM categorias; 
    DECLARE @reseed tinyint = IIF(@@ROWCOUNT > 0, 0, 1);
    DBCC CHECKIDENT (categorias, RESEED, @reseed);
    ') # sqlserver
rescue StandardError => e
  p e.message
  puts 'No sqlserver'
end

Categoria.create!(nombre: 'Sueldo Mensual', icono: 'star', descripcion: 'Sueldo mensual de Leticita',
                  color: '#FF00FF', tipo_categoria_id: 1, cuenta_contable_id: 11201)
