class CreatePagosTarjeta < ActiveRecord::Migration[7.0]
  # Esta migracion crea la tabla pagos_tarjeta
  # La tabla pagos_tarjeta almacena los pagos realizados con tarjeta de credito
  # La tabla tiene los siguientes campos:
  # - fecha: fecha del pago
  # - importe: importe del pago
  # - created_at: fecha de creacion del registro
  # - updated_at: fecha de actualizacion del registro
  def change
    create_table :pagos_tarjeta do |t|
      t.date :fecha
      t.decimal :importe, precision: 12, scale: 4

      t.timestamps
    end
  end
end
