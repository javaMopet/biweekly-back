# frozen_string_literal: true

# begin
#   ActiveRecord::Base.connection.execute('DELETE FROM tipos_cuenta RESTART IDENTITY CASCADE')
# rescue StandardError => e
#   puts "No postgresql database #{e.message}"
# end

begin
  ActiveRecord::Base.connection.execute(
    '
  DELETE FROM cuentas;
    DECLARE @reseedc tinyint = IIF(@@ROWCOUNT > 0, 0, 1);
    DBCC CHECKIDENT (cuentas, RESEED, @reseedc);
  DELETE FROM tipos_cuenta;
    DECLARE @reseed tinyint = IIF(@@ROWCOUNT > 0, 0, 1);
    DBCC CHECKIDENT (tipos_cuenta, RESEED, @reseed);
    '
  )
rescue StandardError => e
  puts "No sqlserver #{e.message}"
end

TipoCuenta.create!(nombre: 'Ahorros', icono: 'account_balance')
TipoCuenta.create!(nombre: 'Efectivo', icono: 'payments')
TipoCuenta.create!(nombre: 'Tarjeta Crédito', icono: 'credit_card')
