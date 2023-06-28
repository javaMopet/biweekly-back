# frozen_string_literal: true

# begin
#   ActiveRecord::Base.connection.execute('TRUNCATE TABLE cuentas_contable RESTART IDENTITY CASCADE')
# rescue StandardError => e
#   puts 'No postgresql'
# end

begin
  ActiveRecord::Base.connection.execute("
    -- DELETE FROM detalles_movimiento;
		-- DECLARE @reseeddm tinyint = IIF(@@ROWCOUNT > 0, 0, 1);
		-- DBCC CHECKIDENT (detalles_movimiento, RESEED, @reseeddm);
    DELETE FROM registros;
		DECLARE @reseedre tinyint = IIF(@@ROWCOUNT > 0, 0, 1);
		DBCC CHECKIDENT (registros, RESEED, @reseedre);
    DELETE FROM categorias;
		DECLARE @reseedc tinyint = IIF(@@ROWCOUNT > 0, 0, 1);
		DBCC CHECKIDENT (categorias, RESEED, @reseedc);
    DELETE FROM cuentas;
		DECLARE @reseedcu tinyint = IIF(@@ROWCOUNT > 0, 0, 1);
		DBCC CHECKIDENT (cuentas, RESEED, @reseedcu);
    DELETE FROM cuentas_contable;
		DECLARE @reseed tinyint = IIF(@@ROWCOUNT > 0, 0, 1);
		DBCC CHECKIDENT (cuentas_contable, RESEED, @reseed)
    ") # sqlserver
rescue StandardError => e
  puts "No sqlserver #{e}"
end

CuentaContable.create!(id: 0o0001, nombre: 'Cuentas Contables', tipo_afectacion: 'N', subnivel: 4)
# Activo
CuentaContable.create!(id: 100_000, nombre: 'Activo', tipo_afectacion: 'C', subnivel: 3, padre_id: 0o0001)
#   Activo circulante
CuentaContable.create!(id: 110_000, nombre: 'Activo Circulante', tipo_afectacion: 'C', subnivel: 2, padre_id: 100_000)
#     Efectivo
CuentaContable.create!(id: 111_000, nombre: 'Efectivo', tipo_afectacion: 'C', subnivel: 1, padre_id: 110_000)
CuentaContable.create!(id: 111_001, nombre: 'Efectivo', tipo_afectacion: 'C', subnivel: 0, padre_id: 111_000)
#     Bancos
CuentaContable.create!(id: 112_000, nombre: 'Bancos', tipo_afectacion: 'C', subnivel: 1, padre_id: 110_000)
CuentaContable.create!(id: 112_001, nombre: 'Bancomer LMS', tipo_afectacion: 'C', subnivel: 0, padre_id: 112_000)
CuentaContable.create!(id: 112_002, nombre: 'Santander HPM', tipo_afectacion: 'C', subnivel: 0, padre_id: 112_000)
CuentaContable.create!(id: 112_003, nombre: 'Scotiabank LMS', tipo_afectacion: 'C', subnivel: 0, padre_id: 112_000)
CuentaContable.create!(id: 112_004, nombre: 'Banco Azteca LMS', tipo_afectacion: 'C', subnivel: 0, padre_id: 112_000)
#     Cuentas por cobrar
CuentaContable.create!(id: 113_000, nombre: 'Cuentas por cobrar', tipo_afectacion: 'C', subnivel: 1, padre_id: 110_000)
CuentaContable.create!(id: 113_001, nombre: 'Crédito de nómina Santander', tipo_afectacion: 'C', subnivel: 0,
                       padre_id: 113_000)
#   Activo no circulante
CuentaContable.create!(id: 120_000, nombre: 'Activo No Circulante', tipo_afectacion: 'C', subnivel: 2,
                       padre_id: 100_000)
#     Inversiones
CuentaContable.create!(id: 121_000, nombre: 'Inversiones', tipo_afectacion: 'C', subnivel: 1, padre_id: 120_000)
CuentaContable.create!(id: 121_001, nombre: 'Prestamo Tito', tipo_afectacion: 'C', subnivel: 0, padre_id: 121_000)
CuentaContable.create!(id: 121_002, nombre: 'Otras inversiones', tipo_afectacion: 'C', subnivel: 0, padre_id: 121_000)
# Pasivo
CuentaContable.create!(id: 200_000, nombre: 'Pasivo', tipo_afectacion: 'A', subnivel: 3, padre_id: 0o0001)
#     Pasivo circulante
CuentaContable.create!(id: 210_000, nombre: 'Pasivo Circulante', tipo_afectacion: 'A', subnivel: 2, padre_id: 200_000)
#         Cuentas por pagar a corto plazo
CuentaContable.create!(id: 211_000, nombre: 'Cuentas por Pagar a Corto Plazo',
                       tipo_afectacion: 'A', subnivel: 1, padre_id: 210_000)
CuentaContable.create!(id: 211_002, nombre: 'Seguro/ Refrendos', tipo_afectacion: 'A', subnivel: 0, padre_id: 211_000)
CuentaContable.create!(id: 211_003, nombre: 'Sypris', tipo_afectacion: 'A', subnivel: 0, padre_id: 211_000)
CuentaContable.create!(id: 211_004, nombre: 'Deudas con proveedores', tipo_afectacion: 'A', subnivel: 0,
                       padre_id: 211_000)
#         Documentos por pagar a Corto Plazo
CuentaContable.create!(id: 212_000, nombre: 'Documentos por Pagar a Corto Plazo',
                       tipo_afectacion: 'A', subnivel: 1, padre_id: 210_000)
CuentaContable.create!(id: 212_001, nombre: 'Tarjeta de crédito Like U Santander', tipo_afectacion: 'A',
                       subnivel: 0, padre_id: 212_000)
CuentaContable.create!(id: 212_002, nombre: 'Tarjeta de crédito Free Santander', tipo_afectacion: 'A',
                       subnivel: 0, padre_id: 212_000)
CuentaContable.create!(id: 212_003, nombre: 'Tarjeta de crédito Scotiabank LMS', tipo_afectacion: 'A',
                       subnivel: 0, padre_id: 212_000)
CuentaContable.create!(id: 212_004, nombre: 'Tarjeta de crédito Bancomer LMS', tipo_afectacion: 'A',
                       subnivel: 0, padre_id: 212_000)
CuentaContable.create!(id: 212_005, nombre: 'Tarjeta de crédito Liverpool HPM', tipo_afectacion: 'A',
                       subnivel: 0, padre_id: 212_000)
CuentaContable.create!(id: 212_006, nombre: 'Tarjeta de crédito Liverpool LMS', tipo_afectacion: 'A',
                       subnivel: 0, padre_id: 212_000)
CuentaContable.create!(id: 212_007, nombre: 'Tarjeta de crédito Visa Liverpool', tipo_afectacion: 'A',
                       subnivel: 0, padre_id: 212_000)
CuentaContable.create!(id: 212_008, nombre: 'Tarjeta de crédito American Express', tipo_afectacion: 'A',
                       subnivel: 0, padre_id: 212_000)
CuentaContable.create!(id: 212_009, nombre: 'Crédito Taos', tipo_afectacion: 'A', subnivel: 0, padre_id: 212_000)
CuentaContable.create!(id: 212_100, nombre: 'Crédito Vacaciones', tipo_afectacion: 'A', subnivel: 0, padre_id: 212_000)
# Ingresos
CuentaContable.create!(id: 400_000, nombre: 'Ingresos', tipo_afectacion: 'A', subnivel: 3, padre_id: 0o0001)
#       Ingreso fijo
CuentaContable.create!(id: 410_000, nombre: 'Ingreso Fijo', tipo_afectacion: 'A', subnivel: 2, padre_id: 400_000)
#             Ingreso nómina
CuentaContable.create!(id: 411_000, nombre: 'Ingreso nómina', tipo_afectacion: 'A', subnivel: 1, padre_id: 410_000)
CuentaContable.create!(id: 411_001, nombre: 'LMS Mensual', tipo_afectacion: 'A', subnivel: 0, padre_id: 411_000)
CuentaContable.create!(id: 411_002, nombre: 'HPM Quincenal', tipo_afectacion: 'A', subnivel: 0, padre_id: 411_000)
CuentaContable.create!(id: 420_000, nombre: 'Ingreso Financieros', tipo_afectacion: 'A', subnivel: 2, padre_id: 400_000)
CuentaContable.create!(id: 421_000, nombre: 'Intereses', tipo_afectacion: 'A', subnivel: 1, padre_id: 420_000)
CuentaContable.create!(id: 421_001, nombre: 'Cash Back', tipo_afectacion: 'A', subnivel: 0, padre_id: 421_000)
CuentaContable.create!(id: 421_002, nombre: 'Interés por inversiones', tipo_afectacion: 'A', subnivel: 0,
                       padre_id: 421_000)
CuentaContable.create!(id: 430_000, nombre: 'Otros Ingresos', tipo_afectacion: 'A', subnivel: 2, padre_id: 400_000)
CuentaContable.create!(id: 431_000, nombre: 'Cuentas por cobrar', tipo_afectacion: 'A', subnivel: 1, padre_id: 430_000)
CuentaContable.create!(id: 431_001, nombre: 'Cobro erika', tipo_afectacion: 'A', subnivel: 0, padre_id: 431_000)
# Gastos
CuentaContable.create!(id: 500_000, nombre: 'Gastos', tipo_afectacion: 'C', subnivel: 3, padre_id: 0o0001)
#     Servicios Generales
CuentaContable.create!(id: 510_000, nombre: 'Servicios Generales', tipo_afectacion: 'C', subnivel: 2, padre_id: 500_000)
#             Servicios recurrentes
CuentaContable.create!(id: 511_000, nombre: 'Servicios Recurrentes', tipo_afectacion: 'C', subnivel: 1,
                       padre_id: 510_000)
CuentaContable.create!(id: 511_001, nombre: 'Telefonia', tipo_afectacion: 'C', subnivel: 0, padre_id: 511_000)
CuentaContable.create!(id: 511_002, nombre: 'Internet', tipo_afectacion: 'C', subnivel: 0, padre_id: 511_000)
CuentaContable.create!(id: 511_003, nombre: 'Netflix', tipo_afectacion: 'C', subnivel: 0, padre_id: 511_000)
CuentaContable.create!(id: 511_004, nombre: 'Spotify', tipo_afectacion: 'C', subnivel: 0, padre_id: 511_000)
CuentaContable.create!(id: 511_005, nombre: 'Agua', tipo_afectacion: 'C', subnivel: 0, padre_id: 511_000)
CuentaContable.create!(id: 511_006, nombre: 'CFE', tipo_afectacion: 'C', subnivel: 0, padre_id: 511_000)
CuentaContable.create!(id: 511_007, nombre: 'Mantenimiento Casa', tipo_afectacion: 'C', subnivel: 0, padre_id: 511_000)
CuentaContable.create!(id: 511_008, nombre: 'Mantenimiento Auto', tipo_afectacion: 'C', subnivel: 0, padre_id: 511_000)
#             Servicios generales
CuentaContable.create!(id: 512_000, nombre: 'Servicios Generales', tipo_afectacion: 'C', subnivel: 1,
                       padre_id: 510_000)
CuentaContable.create!(id: 512_001, nombre: 'Dentista', tipo_afectacion: 'C', subnivel: 0, padre_id: 512_000)
CuentaContable.create!(id: 512_002, nombre: 'Gastos Médicos', tipo_afectacion: 'C', subnivel: 0, padre_id: 512_000)
CuentaContable.create!(id: 512_003, nombre: 'Dentista', tipo_afectacion: 'C', subnivel: 0, padre_id: 512_000)
CuentaContable.create!(id: 512_004, nombre: 'Tramites', tipo_afectacion: 'C', subnivel: 0, padre_id: 512_000)
CuentaContable.create!(id: 512_005, nombre: 'Cursos', tipo_afectacion: 'C', subnivel: 0, padre_id: 512_000)
#             Materiales y suministros
CuentaContable.create!(id: 513_000, nombre: 'Materiales y suministros', tipo_afectacion: 'C', subnivel: 1,
                       padre_id: 510_000)
CuentaContable.create!(id: 513_001, nombre: 'Comida', tipo_afectacion: 'C', subnivel: 0, padre_id: 512_000)
CuentaContable.create!(id: 513_002, nombre: 'Gasolina', tipo_afectacion: 'C', subnivel: 0, padre_id: 512_000)
CuentaContable.create!(id: 513_003, nombre: 'Despensa', tipo_afectacion: 'C', subnivel: 0, padre_id: 513_000)
CuentaContable.create!(id: 513_004, nombre: 'Farmacia', tipo_afectacion: 'C', subnivel: 0, padre_id: 513_000)
CuentaContable.create!(id: 513_005, nombre: 'Insumos y accesorios casa', tipo_afectacion: 'C', subnivel: 0,
                       padre_id: 513_000)
CuentaContable.create!(id: 513_006, nombre: 'Papelería y artículos de oficina', tipo_afectacion: 'C', subnivel: 0,
                       padre_id: 513_000)
CuentaContable.create!(id: 513_007, nombre: 'Ropa calzado y accesorios', tipo_afectacion: 'C', subnivel: 0,
                       padre_id: 513_000)
CuentaContable.create!(id: 513_008, nombre: 'Gas', tipo_afectacion: 'C', subnivel: 0, padre_id: 513_000)
CuentaContable.create!(id: 513_009, nombre: 'Vinos', tipo_afectacion: 'C', subnivel: 0, padre_id: 513_000)
#             Otros gastos
CuentaContable.create!(id: 514_000, nombre: 'Otros gastos', tipo_afectacion: 'C', subnivel: 1, padre_id: 510_000)
CuentaContable.create!(id: 514_001, nombre: 'Regalos y padrinos', tipo_afectacion: 'C', subnivel: 0, padre_id: 514_000)
CuentaContable.create!(id: 514_002, nombre: 'Vacaciones', tipo_afectacion: 'C', subnivel: 0, padre_id: 514_000)
CuentaContable.create!(id: 514_003, nombre: 'Fin de semana', tipo_afectacion: 'C', subnivel: 0, padre_id: 514_000)
CuentaContable.create!(id: 514_004, nombre: 'Ayudas', tipo_afectacion: 'C', subnivel: 0, padre_id: 514_000)
CuentaContable.create!(id: 514_005, nombre: 'Otros', tipo_afectacion: 'C', subnivel: 0, padre_id: 514_000)

CuentaContable.create!(id: 560_000, nombre: 'Bienes muebles e Inmuebles', tipo_afectacion: 'C',
                       subnivel: 2, padre_id: 500_000)
CuentaContable.create!(id: 561_000, nombre: 'Bienes muebles e Inmuebles e intangibles', tipo_afectacion: 'C',
                       subnivel: 1, padre_id: 560_000)
CuentaContable.create!(id: 561_001, nombre: 'Mobiliario y equipo de administración', tipo_afectacion: 'C',
                       subnivel: 0, padre_id: 561_000)
CuentaContable.create!(id: 561_002, nombre: 'Vehiculos y equipo de transporte', tipo_afectacion: 'C',
                       subnivel: 0, padre_id: 561_000)
