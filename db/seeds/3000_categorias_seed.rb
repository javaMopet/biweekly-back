# frozen_string_literal: true

# begin
#   ActiveRecord::Base.connection.execute('DELETE FROM categorias RESTART IDENTITY CASCADE')
# rescue StandardError => e
#   puts "No postgresql database #{e.message}"
# end

begin
  ActiveRecord::Base.connection.execute('
  -- DELETE FROM detalles_movimiento;
    -- DECLARE @reseeddm tinyint = IIF(@@ROWCOUNT > 0, 0, 0);
    -- DBCC CHECKIDENT (detalles_movimiento, RESEED, @reseeddm);
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
Categoria.create!(nombre: 'Saldo Inicial', icono: 'attach_money', descripcion: 'Saldo inicial para la migración',
                  color: '#ff33AA', tipo_movimiento_id: 1, cuenta_contable_id: nil, orden: 400)

Categoria.create!(nombre: 'Crédito Santander', icono: 'local_atm',
                  descripcion: 'Descuento por el crédito de nómina de Santander',
                  color: '#e8045a', tipo_movimiento_id: 2, cuenta_contable_id: 113_001, orden: 500)
Categoria.create!(nombre: 'Teléfono celular', icono: 'phone_iphone', descripcion: 'Telefonia celular Newww',
                  color: '#d9b801', tipo_movimiento_id: 2, cuenta_contable_id: 511_001, orden: 700)
Categoria.create!(nombre: 'Netflix', icono: 'movie', descripcion: 'Netflix',
                  color: '#e8045a', tipo_movimiento_id: 2, cuenta_contable_id: 511_003, orden: 800)
Categoria.create!(nombre: 'Spotify', icono: 'fa-brands fa-spotify', descripcion: 'Spotify',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 900)
Categoria.create!(nombre: 'Crédito Taos', icono: 'directions_car', descripcion: 'Pago mensual de taos',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, cuenta_default_id: 1, orden: 1000)
Categoria.create!(nombre: 'Nuevos Proyectos', icono: 'next_plan', descripcion: 'Nuevos proyectos',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 1100)
Categoria.create!(nombre: 'Agua', icono: 'water_drop', descripcion: 'Agua',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 1200)
Categoria.create!(nombre: 'Internet', icono: 'wifi', descripcion: 'Servicios de internet en casa',
                  color: '#d9b801', tipo_movimiento_id: 2, cuenta_contable_id: 511_002, orden: 700)
Categoria.create!(nombre: 'Gas', icono: 'gas_meter', descripcion: 'Gas LP',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 1300)
Categoria.create!(nombre: 'CFE', icono: 'electric_bolt', descripcion: 'CFE luz eléctrica',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 1400)
Categoria.create!(nombre: 'Dentista', icono: 'fa-solid fa-tooth', descripcion: 'Dentista',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 1500)
Categoria.create!(nombre: 'Tanda', icono: 'savings', descripcion: 'Tanda',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 1600)
Categoria.create!(nombre: 'Gasolina Taos', icono: 'local_gas_station', descripcion: 'Gasolina Taos',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 1700)
Categoria.create!(nombre: 'Gasolina Lancer', icono: 'local_gas_station', descripcion: 'Gasolina Lancer',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 1800)
Categoria.create!(nombre: 'Gastos Médicos', icono: 'medical_services',
                  descripcion: 'Médico, psicólogo, oftalmólogo', color: '#1ad560', tipo_movimiento_id: 2,
                  cuenta_contable_id: 511_004, orden: 1900)
Categoria.create!(nombre: 'Farmacia', icono: 'medication', descripcion: 'Insumos de farmacia',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 2000)
Categoria.create!(nombre: 'Comidas', icono: 'fastfood', descripcion: 'Comidas',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 2100)
Categoria.create!(nombre: 'Comidas efectivo', icono: 'local_dining', descripcion: 'Comidas pagadas en efectivo',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 2200)
Categoria.create!(nombre: 'Despensa', icono: 'shopping_cart', descripcion: 'Despensa pagada sin vales',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 2300)
Categoria.create!(nombre: 'Mary Kay', icono: 'local_mall', descripcion: 'Mary Kay',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 2400)
Categoria.create!(nombre: 'Just', icono: 'emoji_nature', descripcion: 'Just',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 2500)
Categoria.create!(nombre: 'Mobiliario y equipo', icono: 'chair',
                  descripcion: 'Muebles, computadoras, pantallas, teclados, ', color: '#1ad560', tipo_movimiento_id: 2,
                  cuenta_contable_id: 511_004, orden: 2600)
Categoria.create!(nombre: 'Anualidades', icono: 'calendar_month', descripcion: 'Anualidades, ',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 2800)
Categoria.create!(nombre: 'Crédito hipotecario', icono: 'real_estate_agent', descripcion: 'Hipoteca Scotiabank',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 2900)
Categoria.create!(nombre: 'Adecuaciones Casa', icono: 'plumbing', descripcion: 'Adecuaciones casa',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 3000)
Categoria.create!(nombre: 'Mantenimiento Casa', icono: 'imagesearch_roller', descripcion: 'Mantenimiento casa',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 3200)
Categoria.create!(nombre: 'Mantenimiento Auto', icono: 'car_repair', descripcion: 'Mantenimiento auto',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 3300)
Categoria.create!(nombre: 'Accesorios Casa', icono: 'bathtub', descripcion: 'Accesorios casa',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 3400)
Categoria.create!(nombre: 'Ropa, calzado y accesorios', icono: 'dry_cleaning',
                  descripcion: 'Ropa, calzado y accesorios', color: '#1ad560', tipo_movimiento_id: 2,
                  cuenta_contable_id: 511_004, orden: 3500)
Categoria.create!(nombre: 'Trámites', icono: 'fa-solid fa-passport', descripcion: 'Trámites',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 3600)
Categoria.create!(nombre: 'Cursos', icono: 'cast_for_education', descripcion: 'Cursos',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 3700)
Categoria.create!(nombre: 'Vinos', icono: 'liquor', descripcion: 'Vinos y licores, promociones',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 3800)
Categoria.create!(nombre: 'Regalos y padrinos', icono: 'redeem', descripcion: 'Regalos y padrinos',
                  color: '#1ad560', tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 3900)
Categoria.create!(nombre: 'Vacaciones / Días de campo', icono: 'airplanemode_active',
                  descripcion: 'Vacaciones y días de campo', color: '#1ad560', tipo_movimiento_id: 2,
                  cuenta_contable_id: 511_004, orden: 4000)
Categoria.create!(nombre: 'Gastos de fin de semana', icono: 'dinner_dining',
                  descripcion: 'Gasto de fin de semana', color: '#1ad560', tipo_movimiento_id: 2,
                  cuenta_contable_id: 511_004, orden: 4100)
Categoria.create!(nombre: 'Papelería y artículos de oficina', icono: 'palette',
                  descripcion: 'Papelería y artículos de oficina', color: '#1ad560', tipo_movimiento_id: 2,
                  cuenta_contable_id: 511_004, orden: 4200)
Categoria.create!(nombre: 'Otros gastos', icono: 'icecream',
                  descripcion: 'Otros gastos, gasto por comprobar', color: '#1ad560', tipo_movimiento_id: 2,
                  cuenta_contable_id: 511_004, orden: 4300)
Categoria.create!(nombre: 'Sypris reembolsos', icono: 'compare_arrows',
                  descripcion: 'Egreso registrado para reembolso de movimientos de sypris', color: '#1ad560',
                  tipo_movimiento_id: 2, cuenta_contable_id: 511_004, orden: 4400)
Categoria.create!(nombre: 'Devoluciones', icono: 'compare_arrows',
                  descripcion: 'Devoluciones', color: '#1ad560', tipo_movimiento_id: 2,
                  cuenta_contable_id: 511_004, orden: 4500)
Categoria.create!(nombre: 'Retiro para inversion/ahorro', icono: 'attach_money',
                  descripcion: 'Retiro para inversión o ahorro', color: '#1ad560', tipo_movimiento_id: 2,
                  cuenta_contable_id: 511_004, orden: 4600)
Categoria.create!(nombre: 'Inversiones', icono: 'fa-solid fa-sack-dollar', descripcion: 'Interes por inversiones',
                  color: '#d9b801', tipo_movimiento_id: 2, cuenta_contable_id: 121_000, orden: 4700)
Categoria.create!(nombre: 'Reembolsol Sypris', icono: '360', descripcion: 'Reembolsos sypris',
                  color: '#d9b801', tipo_movimiento_id: 2, cuenta_contable_id: 211_003, orden: 4800)
