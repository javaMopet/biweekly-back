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
  
  CuentaContable.create!(id: 10000, nombre: "Activo", tipo_afectacion: "C", subnivel: 3  )
  CuentaContable.create!(id: 11000, nombre: "Activo Circulante", tipo_afectacion: "C", subnivel: 2, padre_id: 10000)
  CuentaContable.create!(id: 11100, nombre: "Efectivo", tipo_afectacion: "C", subnivel: 1, padre_id: 11000)
  CuentaContable.create!(id: 11101, nombre: "Efectivo", tipo_afectacion: "C", subnivel: 0, padre_id: 11100)

  CuentaContable.create!(id: 11200, nombre: "Bancos", tipo_afectacion: "C", subnivel: 1, padre_id: 11000)
  CuentaContable.create!(id: 11201, nombre: "Bancomer LMS", tipo_afectacion: "C", subnivel: 0, padre_id: 11200)
  CuentaContable.create!(id: 11202, nombre: "Santander HPM", tipo_afectacion: "C", subnivel: 0, padre_id: 11200)
  CuentaContable.create!(id: 11203, nombre: "Scotiabank LMS", tipo_afectacion: "C", subnivel: 0, padre_id: 11200)
  CuentaContable.create!(id: 11204, nombre: "Banco Azteca LMS", tipo_afectacion: "C", subnivel: 0, padre_id: 11200)


  CuentaContable.create!(id: 13000, nombre: "Activo No Circulante", tipo_afectacion: "C", subnivel: 2, padre_id: 10000)
  CuentaContable.create!(id: 13100, nombre: "Efectivo", tipo_afectacion: "C", subnivel: 1, padre_id: 11000)
  CuentaContable.create!(id: 13101, nombre: "Efectivo", tipo_afectacion: "C", subnivel: 0, padre_id: 11100)

  