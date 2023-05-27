class CreateCortesCuenta < ActiveRecord::Migration[7.0]
  def change
    create_table :cortes_cuenta do |t|
      t.decimal :saldo_inicial, precision: 10, scale: 4
      t.decimal :saldo_final, precision: 10, scale: 4
      t.date :fecha_inicial
      t.date :fecha_final
      t.string :estatus, limit: 1

      t.timestamps
    end
  end
end
