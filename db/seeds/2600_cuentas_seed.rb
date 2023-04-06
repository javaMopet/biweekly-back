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

Cuenta.create!(nombre: 'Bacomer LMS', tipo_cuenta_id: 1,
               descripcion: 'Cuenta de Ahorros de LMS en Bancomer',
               cuenta_contable_id: 112_001)
Cuenta.create!(nombre: 'Santander HPM', tipo_cuenta_id: 1,
               descripcion: 'Cuenta de Ahorros de HPM en Santander',
               cuenta_contable_id: 112_002)
Cuenta.create!(nombre: 'Scotiabank', tipo_cuenta_id: 1,
               descripcion: 'Cuenta de Scotiabank para el pago de hipoteca',
               cuenta_contable_id: 112_003)
Cuenta.create!(nombre: 'Banco azteca', tipo_cuenta_id: 1,
               descripcion: 'Cuenta de Ahorros Banco Azteca',
               cuenta_contable_id: 112_004)
