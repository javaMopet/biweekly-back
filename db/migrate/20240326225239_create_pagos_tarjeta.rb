class CreatePagosTarjeta < ActiveRecord::Migration[7.0]
  def change
    create_table :pagos_tarjeta do |t|
      t.date :fecha
      t.decimal :importe, precision: 12, scale: 4

      t.timestamps
    end
  end
end
