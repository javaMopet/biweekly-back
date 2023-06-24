# frozen_string_literal: true

begin
  ActiveRecord::Base.connection.execute('DELETE FROM cuentas RESTART IDENTITY CASCADE')
rescue StandardError => e
  puts "No postgresql database #{e.message}"
end

begin
  ActiveRecord::Base.connection.execute('DELETE FROM cuentas;
    DECLARE @reseed tinyint = IIF(@@ROWCOUNT > 0, 0, 0);
    DBCC CHECKIDENT (cuentas, RESEED, @reseed);
    ') # sqlserver
rescue StandardError => e
  puts "No sqlserver #{e.message}"
end

Cuenta.create!(nombre: 'Bacomer LMS', tipo_cuenta_id: 1, banco_id: 2,
               identificador: '2659',
               cuenta_contable_id: 112_001)
Cuenta.create!(nombre: 'Santander HPM', tipo_cuenta_id: 1, banco_id: 1,
               identificador: '37889',
               cuenta_contable_id: 112_002)
Cuenta.create!(nombre: 'Scotiabank', tipo_cuenta_id: 1, banco_id: 3,
               identificador: '2058',
               cuenta_contable_id: 112_003)
Cuenta.create!(nombre: 'Banco azteca', tipo_cuenta_id: 1, banco_id: 4,
               identificador: '5573',
               cuenta_contable_id: 112_004)
Cuenta.create!(nombre: 'Santander Like U', tipo_cuenta_id: 3, banco_id: 1,
               identificador: '3376',
               cuenta_contable_id: 212_001)
Cuenta.create!(nombre: 'Bancomer Oro', tipo_cuenta_id: 3, banco_id: 2,
               identificador: '2587',
               cuenta_contable_id: 212_001)
Cuenta.create!(nombre: 'Banamex prueba', tipo_cuenta_id: 1, banco_id: 5,
               identificador: '3378',
               cuenta_contable_id: 212_001)
