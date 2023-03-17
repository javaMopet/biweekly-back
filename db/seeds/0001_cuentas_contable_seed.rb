begin
    ActiveRecord::Base.connection.execute('TRUNCATE TABLE cuentas_contable RESTART IDENTITY CASCADE')
  rescue StandardError => e
    puts 'No postgresql'
  end
  
  begin
    ActiveRecord::Base.connection.execute('DELETE FROM cuentas_contable') # sqlserver
    # ActiveRecord::Base.connection.execute('DELETE FROM cuentas_contable; DBCC CHECKIDENT (cuentas_contable, RESEED, 0)') # sqlserver
  rescue StandardError => e
    puts 'No sqlserver'
  end
  # Activo
  CuentaContable.create!(id: 10000, nombre: "Activo", tipo_afectacion: "C", subnivel: 3  )
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

  # Pasivo
  CuentaContable.create!(id: 20000, nombre: "Activo", tipo_afectacion: "A", subnivel: 3  )
  CuentaContable.create!(id: 21000, nombre: "Activo Circulante", tipo_afectacion: "A", subnivel: 2, padre_id: 10000)
  CuentaContable.create!(id: 21100, nombre: "Efectivo", tipo_afectacion: "A", subnivel: 1, padre_id: 11000)
  CuentaContable.create!(id: 21101, nombre: "Efectivo", tipo_afectacion: "A", subnivel: 0, padre_id: 11100)
  CuentaContable.create!(id: 21102, nombre: "Efectivo", tipo_afectacion: "A", subnivel: 0, padre_id: 11100)
  CuentaContable.create!(id: 21103, nombre: "Efectivo", tipo_afectacion: "A", subnivel: 0, padre_id: 11100)
  CuentaContable.create!(id: 21104, nombre: "Efectivo", tipo_afectacion: "A", subnivel: 0, padre_id: 11100)

  CuentaContable.create!(id: 21200, nombre: "Bancos", tipo_afectacion: "A", subnivel: 1, padre_id: 11000)

  CuentaContable.create!(id: 22000, nombre: "Bancomer LMS", tipo_afectacion: "A", subnivel: 0, padre_id: 11200)
  CuentaContable.create!(id: 22100, nombre: "Santander HPM", tipo_afectacion: "A", subnivel: 0, padre_id: 11200)
  CuentaContable.create!(id: 22101, nombre: "Scotiabank LMS", tipo_afectacion: "A", subnivel: 0, padre_id: 11200)
  CuentaContable.create!(id: 22102, nombre: "Banco Azteca LMS", tipo_afectacion: "A", subnivel: 0, padre_id: 11200)

  #Ingresos
  CuentaContable.create!(id: 40000, nombre: "Ingresos", tipo_afectacion: "A", subnivel: 2, padre_id: nil)
  CuentaContable.create!(id: 41000, nombre: "Ingreso Fijo", tipo_afectacion: "A", subnivel: 1, padre_id: 40000)
  CuentaContable.create!(id: 41100, nombre: "Ingresos por nómina", tipo_afectacion: "A", subnivel: 0, padre_id: 41000)

  # Gastos
  CuentaContable.create!(id: 50000, nombre: "Gastos", tipo_afectacion: "C", subnivel: 2, padre_id: nil)
  CuentaContable.create!(id: 51000, nombre: "Gasto corriente", tipo_afectacion: "C", subnivel: 1, padre_id: 50000)
  CuentaContable.create!(id: 51100, nombre: "Servicios Generales", tipo_afectacion: "C", subnivel: 0, padre_id: 51000)