class CreateRegistrosTarjeta < ActiveRecord::Migration[7.0]
  def change
    create_table :registros_tarjeta do |t|
      t.references :estado_registro_tarjeta, null: false, foreign_key: true
      t.references :cuenta, null: false, foreign_key: true
      t.references :categoria, null: false, foreign_key: true
      t.decimal :importe, precision: 10, scale: 4
      t.date :fecha
      t.string :concepto, limit: 1000

      t.timestamps
    end
  end
end
