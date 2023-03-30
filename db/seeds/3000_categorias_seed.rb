# frozen_string_literal: true

begin
  ActiveRecord::Base.connection.execute('DELETE FROM categorias RESTART IDENTITY CASCADE')
rescue StandardError => e
  puts "No postgresql database #{e.message}"
end

begin
  ActiveRecord::Base.connection.execute('DELETE FROM categorias;
    DECLARE @reseed tinyint = IIF(@@ROWCOUNT > 0, 0, 1);
    DBCC CHECKIDENT (categorias, RESEED, @reseed);
    ') # sqlserver
rescue StandardError => e
  puts "No sqlserver #{e.message}"
end

Categoria.create!(nombre: 'Sueldo Mensual', icono: 'account_balance',
                  descripcion: 'Sueldo mensual de Leticita', color: '#005c00',
                  tipo_categoria_id: 1, cuenta_contable_id: 41_101)
Categoria.create!(nombre: 'Sueldo Quincenal', icono: 'account_balance',
                  descripcion: 'Sueldo quincenal de Horacio', color: '#005c00',
                  tipo_categoria_id: 1, cuenta_contable_id: 41_102)
Categoria.create!(nombre: 'Cash Back', icono: 'currency_exchange',
                  descripcion: 'Promoción por tarjeta Santander LikeU', color: '#ff3333',
                  tipo_categoria_id: 1, cuenta_contable_id: 42_101)
# Categoria.create!(nombre: 'Sueldo Quincenal', icono: 'account_balance',
#                   descripcion: 'Sueldo quincenal de Horacio', color: '#005c00',
#                   tipo_categoria_id: 1, cuenta_contable_id: 41_102)

Categoria.create!(nombre: 'Cash Back', icono: 'star',
                  descripcion: 'Promoción originada por tarjeta Cash Back LikeU', color: '#FF00FF',
                  tipo_categoria_id: 1, cuenta_contable_id: 42_101)
Categoria.create!(nombre: 'Inversiones', icono: 'fa-solid fa-sack-dollar',
                  descripcion: 'Interes por inversiones', color: '#FF00FF',
                  tipo_categoria_id: 1, cuenta_contable_id: 42_102)
