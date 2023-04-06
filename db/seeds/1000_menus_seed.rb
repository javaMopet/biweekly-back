# frozen_string_literal: true

# begin
#   ActiveRecord::Base.connection.execute('DELETE FROM menus RESTART IDENTITY CASCADE')
#   ActiveRecord::Base.connection.execute('DELETE FROM permisos RESTART IDENTITY CASCADE')
# rescue StandardError => e
#   puts 'No postgresql'
# end

begin
  ActiveRecord::Base.connection.execute('DELETE FROM menus;
    DECLARE @reseed tinyint = IIF(@@ROWCOUNT > 0, 0, 1);
    DBCC CHECKIDENT (menus, RESEED, @reseed);
    ') # sqlserver
rescue StandardError => e
  p e.message
  puts 'No sqlserver'
end

Menu.create!(nombre: 'Movimientos', icono: 'list', ruta: 'movimientos', padre: 0, tiene_hijos: 1,
             orden: 100, activo: 1)

menu_administracion = Menu.create!(nombre: 'Administracion', icono: 'computer', ruta: 'admin',
                                   padre: 0, tiene_hijos: 1, orden: 200, activo: 1)

Menu.create!(nombre: 'Categorias', icono: 'category', ruta: 'categorias',
             padre: menu_administracion.id, tiene_hijos: 1, orden: 300, activo: 1)

Menu.create!(nombre: 'Cuentas', icono: 'wallet', ruta: 'cuentas',
             padre: menu_administracion.id, tiene_hijos: 1, orden: 310, activo: 1)
Menu.create!(nombre: 'Cuentas Contables', icono: 'list_alt', ruta: 'cuentas_contables',
             padre: menu_administracion.id, tiene_hijos: 1, orden: 320, activo: 1)

Menu.create!(nombre: 'Opciones', icono: 'settings', ruta: 'system_options', padre: 0,
             tiene_hijos: 1, orden: 600, activo: 1)
