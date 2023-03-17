begin
    ActiveRecord::Base.connection.execute('TRUNCATE TABLE cuentas RESTART IDENTITY CASCADE')
  rescue StandardError => e
    puts "No postgresql #{e}"
  end
  
  begin
    ActiveRecord::Base.connection.execute('DELETE FROM cuentas') # sqlserver
    # ActiveRecord::Base.connection.execute('DELETE FROM cuentas_contable; DBCC CHECKIDENT (cuentas_contable, RESEED, 0)') # sqlserver
  rescue StandardError => e
    puts "No sqlserver #{e}"
  end
  
Cuenta.create!(nombre: "Bacomer LMS", descripcion: "Cuenta de Ahorros de LMS en Bancomer", 
                 cuenta_contable_id: 21201)
Cuenta.create!(nombre: "Santander HPM", descripcion: "Cuenta de Ahorros de HPM en Santander", 
                 cuenta_contable_id: 21202)