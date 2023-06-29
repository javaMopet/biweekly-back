class CreateRegistrosTarjeta < ActiveRecord::Migration[7.0]
  def change
    create_table :registros_tarjeta do |t|
      t.references :estado_registro_tarjeta, null: false, foreign_key: true
      t.references :cuenta, null: false, foreign_key: true
      t.references :categoria, null: true, foreign_key: true
      t.string :tipo_afectacion, limit: 1, null: false
      t.decimal :importe, precision: 10, scale: 4
      t.date :fecha, null: false
      t.string :concepto, limit: 1000
      t.references :registro, null: true, foreign_key: true
      t.boolean :is_msi, null: false, default: 0
      t.integer :numero_msi, null: true

      t.timestamps
    end
  end
end
