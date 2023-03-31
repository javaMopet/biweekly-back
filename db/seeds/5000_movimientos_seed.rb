# frozen_string_literal: true

begin
  ActiveRecord::Base.connection.execute('DELETE FROM detalles_movimiento RESTART IDENTITY CASCADE;
  DELETE FROM movimientos RESTART IDENTITY CASCADE')
rescue StandardError => e
  puts "No postgresql #{e.message}"
end

begin
  ActiveRecord::Base.connection.execute('DELETE FROM detalles_movimiento;
    DECLARE @reseed tinyint = IIF(@@ROWCOUNT > 0, 0, 1);
    DBCC CHECKIDENT (detalles_movimiento, RESEED, @reseed);
    DELETE FROM movimientos;
    DECLARE @reseedM tinyint = IIF(@@ROWCOUNT > 0, 0, 1);
    DBCC CHECKIDENT (movimientos, RESEED, @reseedM);
    ') # sqlserver
rescue StandardError => e
  p e.message
  puts 'No sqlserver'
end

movimiento = Movimiento.create!(numero: 1, estado_movimiento_id: 2, tipo_movimiento_id: 1,
                                fecha: Date.today, obsevaciones: 'Sueldo Mensual', user_id: 1)

DetalleMovimiento.create!(movimiento_id: movimiento.id, categoria_id: 1, cuenta_id: nil,
                          importe: 20_500.26, tipo_afectacion: 'A',
                          tipo_detalle: 'N',
                          cuenta_contable_id: 41_101)
DetalleMovimiento.create!(movimiento_id: movimiento.id, categoria_id: nil, cuenta_id: 1,
                          importe: 20_500.26, tipo_afectacion: 'C',
                          tipo_detalle: 'B',
                          cuenta_contable_id: 41_101)

movimiento2 = Movimiento.create!(numero: 1, estado_movimiento_id: 2, tipo_movimiento_id: 1,
                                 fecha: Date.today, obsevaciones: 'Sueldo Quincenal', user_id: 1)

DetalleMovimiento.create!(movimiento_id: movimiento2.id, categoria_id: 1, cuenta_id: nil,
                          importe: 30_502.26, tipo_afectacion: 'A',
                          tipo_detalle: 'N',
                          cuenta_contable_id: 41_101)
DetalleMovimiento.create!(movimiento_id: movimiento2.id, categoria_id: nil, cuenta_id: 1,
                          importe: 30_502.26, tipo_afectacion: 'C',
                          tipo_detalle: 'B',
                          cuenta_contable_id: 41_101)
