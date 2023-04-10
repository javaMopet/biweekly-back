# frozen_string_literal: true

# begin
#   ActiveRecord::Base.connection.execute('DELETE FROM categorias RESTART IDENTITY CASCADE')
# rescue StandardError => e
#   puts "No postgresql database #{e.message}"
# end

begin
  ActiveRecord::Base.connection.execute('
  DELETE FROM detalles_movimiento;
    DECLARE @reseeddm tinyint = IIF(@@ROWCOUNT > 0, 0, 0);
    DBCC CHECKIDENT (detalles_movimiento, RESEED, @reseeddm);
  DELETE FROM categorias;
    DECLARE @reseed tinyint = IIF(@@ROWCOUNT > 0, 0, 0);
    DBCC CHECKIDENT (categorias, RESEED, @reseed);
    ') # sqlserver
rescue StandardError => e
  puts "No sqlserver #{e.message}"
end

Categoria.create!(nombre: 'Sueldo Mensual', icono: 'account_balance', descripcion: 'Sueldo mensual de Leticita',
                  color: '#005c00', tipo_movimiento_id: 1, cuenta_contable_id: 411_001, orden: 100)
Categoria.create!(nombre: 'Sueldo Quincenal', icono: 'account_balance', descripcion: 'Sueldo quincenal de Horacio',
                  color: '#005c00', tipo_movimiento_id: 1, cuenta_contable_id: 411_002, orden: 200)
Categoria.create!(nombre: 'Cash Back', icono: 'currency_exchange', descripcion: 'Promoción por tarjeta Santander LikeU',
                  color: '#ff3333', tipo_movimiento_id: 1, cuenta_contable_id: 421_001, orden: 300)
Categoria.create!(nombre: 'Inversiones', icono: 'fa-solid fa-sack-dollar', descripcion: 'Interes por inversiones',
                  color: '#d9b801', tipo_movimiento_id: 1, cuenta_contable_id: 121_000, orden: 400)
Categoria.create!(nombre: 'Crédito Santander', icono: 'local_atm',
                  descripcion: 'Descuento por el crédito de nómina de Santander',
                  color: '#e8045a', tipo_movimiento_id: 2, cuenta_contable_id: 113_001, orden: 500)
Categoria.create!(nombre: 'Comida', icono: 'local_dining', descripcion: 'Comida HPM', color: '#d9b801',
                  tipo_movimiento_id: 2, cuenta_contable_id: 513_001, orden: 600)
Categoria.create!(nombre: 'Teléfono celular', icono: '4g_plus_mobiledata', descripcion: 'Telefonia celular Newww',
                  color: '#d9b801', tipo_movimiento_id: 2, cuenta_contable_id: 511_001, orden: 700)
Categoria.create!(nombre: 'Netflix', icono: 'movie', descripcion: 'Netflix',
                  color: '#e8045a', tipo_movimiento_id: 2, cuenta_contable_id: 511_003, orden: 800)
Categoria.create!(nombre: 'Spotify', icono: 'fa-brands fa-spotify', descripcion: 'Spotify',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 900)

Categoria.create!(nombre: 'Crédito Taos', icono: 'fa-brands fa-spotify', descripcion: 'Pago mensual de taos',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, cuenta_id: 1, orden: 1000)
Categoria.create!(nombre: 'Nuevos Proyectos', icono: 'fa-brands fa-spotify', descripcion: 'Nuevos proyectos',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 1100)
Categoria.create!(nombre: 'Agua', icono: 'fa-brands fa-spotify', descripcion: 'Agua',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 1200)
Categoria.create!(nombre: 'Gas', icono: 'fa-brands fa-spotify', descripcion: 'Gas LP',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 1300)
Categoria.create!(nombre: 'CFE', icono: 'fa-brands fa-spotify', descripcion: 'CFE luz eléctrica',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 1400)
Categoria.create!(nombre: 'Dentista', icono: 'fa-brands fa-spotify', descripcion: 'Dentista',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 1500)
Categoria.create!(nombre: 'Tanda', icono: 'fa-brands fa-spotify', descripcion: 'Tanda',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 1600)
Categoria.create!(nombre: 'Gasolina Taos', icono: 'fa-brands fa-spotify', descripcion: 'Gasolina Taos',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 1700)

Categoria.create!(nombre: 'Gasolina Lancer', icono: 'fa-brands fa-spotify', descripcion: 'Gasolina Lancer',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 1800)
Categoria.create!(nombre: 'Gastos Médicos', icono: 'fa-brands fa-spotify',
                  descripcion: 'Médico, psicólogo, oftalmólogo', color: '#1ad560', tipo_movimiento_id: 2,
                  cuenta_contable_id: 511_004, orden: 1900)
Categoria.create!(nombre: 'Farmacia', icono: 'fa-brands fa-spotify', descripcion: 'Insumos de farmacia',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 2000)
Categoria.create!(nombre: 'Comidas', icono: 'fa-brands fa-spotify', descripcion: 'Comidas',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 2100)
Categoria.create!(nombre: 'Comidas efectivo', icono: 'fa-brands fa-spotify', descripcion: 'Comidas pagadas en efectivo',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 2200)
Categoria.create!(nombre: 'Despensa', icono: 'fa-brands fa-spotify', descripcion: 'Despensa pagada sin vales',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 2300)
Categoria.create!(nombre: 'Mary Kay', icono: 'fa-brands fa-spotify', descripcion: 'Mary Kay',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 2400)
Categoria.create!(nombre: 'Just', icono: 'fa-brands fa-spotify', descripcion: 'Just',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 2500)
Categoria.create!(nombre: 'Mobiliario y equipo', icono: 'fa-brands fa-spotify',
                  descripcion: 'Muebles, computadoras, pantallas, teclados, ', color: '#1ad560', tipo_movimiento_id: 2,
                  cuenta_contable_id: 511_004, orden: 2600)

# Categoria.create!(nombre: 'Mobiliario y equipo', icono: 'fa-brands fa-spotify',
#                   descripcion: 'Muebles, computadoras, pantallas, teclados, ', color: '#1ad560', tipo_movimiento_id: 2,
#                   cuenta_contable_id: 511_004, orden: 2700)
Categoria.create!(nombre: 'Anualidades', icono: 'fa-brands fa-spotify', descripcion: 'Anualidades, ',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 2800)
Categoria.create!(nombre: 'Crédito hipotecario', icono: 'fa-brands fa-spotify', descripcion: 'Hipoteca Scotiabank',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 2900)
Categoria.create!(nombre: 'Adecuaciones Casa', icono: 'fa-brands fa-spotify', descripcion: 'Adecuaciones casa',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 3000)

# Categoria.create!(nombre: 'Adecuaciones Casa', icono: 'fa-brands fa-spotify', descripcion: 'Adecuaciones casa',
#                   color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 3100)
Categoria.create!(nombre: 'Mantenimiento Casa', icono: 'fa-brands fa-spotify', descripcion: 'Mantenimiento casa',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 3200)
Categoria.create!(nombre: 'Mantenimiento Auto', icono: 'fa-brands fa-spotify', descripcion: 'Mantenimiento auto',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 3300)
Categoria.create!(nombre: 'Accesorios Casa', icono: 'fa-brands fa-spotify', descripcion: 'Accesorios casa',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 3400)
Categoria.create!(nombre: 'Ropa, calzado y accesorios', icono: 'fa-brands fa-spotify',
                  descripcion: 'Ropa, calzado y accesorios', color: '#1ad560', tipo_movimiento_id: 2,
                  cuenta_contable_id: 511_004, orden: 3500)
Categoria.create!(nombre: 'Trámites', icono: 'fa-brands fa-spotify', descripcion: 'Trámites',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 3600)
Categoria.create!(nombre: 'Cursos', icono: 'fa-brands fa-spotify', descripcion: 'Cursos',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 3700)

Categoria.create!(nombre: 'Vinos', icono: 'fa-brands fa-spotify', descripcion: 'Vinos y licores, promociones',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 3800)
Categoria.create!(nombre: 'Regalos y padrinos', icono: 'fa-brands fa-spotify', descripcion: 'Regalos y padrinos',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 3900)
Categoria.create!(nombre: 'Vacaciones / Días de campo', icono: 'fa-brands fa-spotify',
                  descripcion: 'Vacaciones y días de campo', color: '#1ad560', tipo_movimiento_id: 2,
                  cuenta_contable_id: 511_004, orden: 4000)
Categoria.create!(nombre: 'Gastos de fin de semana', icono: 'fa-brands fa-spotify',
                  descripcion: 'Gasto de fin de semana', color: '#1ad560', tipo_movimiento_id: 2,
                  cuenta_contable_id: 511_004, orden: 4100)
Categoria.create!(nombre: 'Papelería y artículos de oficina', icono: 'fa-brands fa-spotify',
                  descripcion: 'Papelería y artículos de oficina', color: '#1ad560', tipo_movimiento_id: 2,
                  cuenta_contable_id: 511_004, orden: 4200)
Categoria.create!(nombre: 'Otros gastos', icono: 'fa-brands fa-spotify',
                  descripcion: 'Otros gastos, gasto por comprobar', color: '#1ad560', tipo_movimiento_id: 2,
                  cuenta_contable_id: 511_004, orden: 4300)

Categoria.create!(nombre: 'Sypris reembolsos', icono: 'fa-brands fa-spotify',
                  descripcion: 'Egreso registrado para reembolso de movimientos de sypris', color: '#1ad560',
                  tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 4400)
Categoria.create!(nombre: 'Devoluciones', icono: 'fa-brands fa-spotify',
                  descripcion: 'Devoluciones', color: '#1ad560', tipo_movimiento_id: 2,
                  cuenta_contable_id: 511_004, orden: 4500)
Categoria.create!(nombre: 'Retiro para inversion/ahorro', icono: 'fa-brands fa-spotify',
                  descripcion: 'Retiro para inversión o ahorro', color: '#1ad560', tipo_movimiento_id: 2,
                  cuenta_contable_id: 511_004, orden: 4600)
