begin
    ActiveRecord::Base.connection.execute('TRUNCATE TABLE cuentas_contable RESTART IDENTITY CASCADE')
  rescue StandardError => e
    puts 'No postgresql'
  end
  
  begin    
    ActiveRecord::Base.connection.execute("
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

  CuentaContable.create!(id: 00001, nombre: "Cuentas Contables", tipo_afectacion: "N", subnivel: 4  )
  # Activo
  CuentaContable.create!(id: 10000, nombre: "Activo", tipo_afectacion: "C", subnivel: 3, padre_id: 00001  )
  CuentaContable.create!(id: 11000, nombre: "Activo Circulante", tipo_afectacion: "C", subnivel: 2, padre_id: 10000)

  CuentaContable.create!(id: 11100, nombre: "Efectivo", tipo_afectacion: "C", subnivel: 1, padre_id: 11000)
  CuentaContable.create!(id: 11101, nombre: "Efectivo", tipo_afectacion: "C", subnivel: 0, padre_id: 11100)

  CuentaContable.create!(id: 11200, nombre: "Bancos", tipo_afectacion: "C", subnivel: 1, padre_id: 11000)
  CuentaContable.create!(id: 11201, nombre: "Bancomer LMS", tipo_afectacion: "C", subnivel: 0, padre_id: 11200)
  CuentaContable.create!(id: 11202, nombre: "Santander HPM", tipo_afectacion: "C", subnivel: 0, padre_id: 11200)
  CuentaContable.create!(id: 11203, nombre: "Scotiabank LMS", tipo_afectacion: "C", subnivel: 0, padre_id: 11200)
  CuentaContable.create!(id: 11204, nombre: "Banco Azteca LMS", tipo_afectacion: "C", subnivel: 0, padre_id: 11200)

  CuentaContable.create!(id: 12000, nombre: "Activo No Circulante", tipo_afectacion: "C", subnivel: 2, padre_id: 10000)
  CuentaContable.create!(id: 12100, nombre: "Inversiones", tipo_afectacion: "C", subnivel: 1, padre_id: 12000)
  CuentaContable.create!(id: 12101, nombre: "Prestamo Tito", tipo_afectacion: "C", subnivel: 0, padre_id: 12100)
  CuentaContable.create!(id: 12102, nombre: "Otras inversiones", tipo_afectacion: "C", subnivel: 0, padre_id: 12100)
  # Pasivo
  CuentaContable.create!(id: 20000, nombre: "Pasivo", tipo_afectacion: "A", subnivel: 3 , padre_id: 00001  )
  CuentaContable.create!(id: 21000, nombre: "Pasivo Circulante", tipo_afectacion: "A", subnivel: 2, padre_id: 20000)
  CuentaContable.create!(id: 21100, nombre: "Cuentas por Pagar a Corto Plazo", 
                         tipo_afectacion: "A", subnivel: 1, padre_id: 21000)
  CuentaContable.create!(id: 21101, nombre: "Tarjeta de crédito", tipo_afectacion: "A", subnivel: 0, padre_id: 21100)
  CuentaContable.create!(id: 21102, nombre: "Seguro/ Refrendos", tipo_afectacion: "A", subnivel: 0, padre_id: 21100)
  CuentaContable.create!(id: 21103, nombre: "Sypris", tipo_afectacion: "A", subnivel: 0, padre_id: 21100)
  CuentaContable.create!(id: 21104, nombre: "Deudas con proveedores", tipo_afectacion: "A", subnivel: 0, padre_id: 21100)
  CuentaContable.create!(id: 21200, nombre: "Documentos por Pagar a Corto Plazo", 
                         tipo_afectacion: "A", subnivel: 1, padre_id: 21000)
  CuentaContable.create!(id: 21201, nombre: "Crédito Taos", tipo_afectacion: "A", subnivel: 0, padre_id: 21200)
  CuentaContable.create!(id: 21202, nombre: "Crédito Vacaciones", tipo_afectacion: "A", subnivel: 0, padre_id: 21200)  
  # Ingresos
  CuentaContable.create!(id: 40000, nombre: "Ingresos", tipo_afectacion: "A", subnivel: 3, padre_id: 00001 )
  CuentaContable.create!(id: 41000, nombre: "Ingreso Fijo", tipo_afectacion: "A", subnivel: 2, padre_id: 40000)
  CuentaContable.create!(id: 41100, nombre: "Ingreso nómina", tipo_afectacion: "A", subnivel: 1, padre_id: 41000)
  CuentaContable.create!(id: 41101, nombre: "LMS Mensual", tipo_afectacion: "A", subnivel: 0, padre_id: 41100)
  CuentaContable.create!(id: 41102, nombre: "HPM Quincenal", tipo_afectacion: "A", subnivel: 0, padre_id: 41100)
  CuentaContable.create!(id: 42000, nombre: "Ingreso Financieros", tipo_afectacion: "A", subnivel: 2, padre_id: 40000)
  CuentaContable.create!(id: 42100, nombre: "Intereses", tipo_afectacion: "A", subnivel: 1, padre_id: 42000)
  CuentaContable.create!(id: 42101, nombre: "Cash Back", tipo_afectacion: "A", subnivel: 0, padre_id: 42100)
  CuentaContable.create!(id: 42102, nombre: "Interés por inversiones", tipo_afectacion: "A", subnivel: 0, 
                         padre_id: 42100)
  CuentaContable.create!(id: 43000, nombre: "Otros Ingresos", tipo_afectacion: "A", subnivel: 2, padre_id: 40000)
  CuentaContable.create!(id: 43100, nombre: "Cuentas por cobrar", tipo_afectacion: "A", subnivel: 1, padre_id: 43000)
  CuentaContable.create!(id: 43101, nombre: "Cobro erika", tipo_afectacion: "A", subnivel: 0, padre_id: 43100)
  # Gastos
  CuentaContable.create!(id: 50000, nombre: "Gastos", tipo_afectacion: "C", subnivel: 3, padre_id: 00001 )
  CuentaContable.create!(id: 51000, nombre: "Gasto corriente", tipo_afectacion: "C", subnivel: 2, padre_id: 50000)
  CuentaContable.create!(id: 51100, nombre: "Servicios Generales", tipo_afectacion: "C", subnivel: 1, padre_id: 51000)
  CuentaContable.create!(id: 51101, nombre: "Dentista", tipo_afectacion: "C", subnivel: 0, padre_id: 51100)
  CuentaContable.create!(id: 51102, nombre: "Seguro refrendos", tipo_afectacion: "C", subnivel: 0, padre_id: 51100)
  CuentaContable.create!(id: 51103, nombre: "Telefonia", tipo_afectacion: "C", subnivel: 0, padre_id: 51100)
  CuentaContable.create!(id: 51200, nombre: "Materiales y suministros", tipo_afectacion: "C", subnivel: 1, 
                         padre_id: 51000)
  CuentaContable.create!(id: 51201, nombre: "Gasolina", tipo_afectacion: "C", subnivel: 0, padre_id: 51200)
  CuentaContable.create!(id: 51202, nombre: "Despensa", tipo_afectacion: "C", subnivel: 0, padre_id: 51200)
  CuentaContable.create!(id: 51203, nombre: "Comida", tipo_afectacion: "C", subnivel: 0, padre_id: 51200)
  CuentaContable.create!(id: 51300, nombre: "Otros gastos", tipo_afectacion: "C", subnivel: 1, padre_id: 51000)
  CuentaContable.create!(id: 51301, nombre: "Padrinos", tipo_afectacion: "C", subnivel: 0, padre_id: 51300)
  CuentaContable.create!(id: 51302, nombre: "Ayudas", tipo_afectacion: "C", subnivel: 0, padre_id: 51300)
  CuentaContable.create!(id: 51303, nombre: "Otros", tipo_afectacion: "C", subnivel: 0, padre_id: 51300)
  CuentaContable.create!(id: 56000, nombre: "Bienes muebles e Inmuebles", tipo_afectacion: "C", 
                         subnivel: 2, padre_id: 50000)
  CuentaContable.create!(id: 56100, nombre: "Bienes muebles e Inmuebles e intangibles", tipo_afectacion: "C", 
                         subnivel: 1, padre_id: 56000)
  CuentaContable.create!(id: 56101, nombre: "Mobiliario y equipo de administración", tipo_afectacion: "C", 
                         subnivel: 0, padre_id: 56100)
  CuentaContable.create!(id: 56102, nombre: "Vehiculos y equipo de transporte", tipo_afectacion: "C",
                         subnivel: 0, padre_id: 56100)