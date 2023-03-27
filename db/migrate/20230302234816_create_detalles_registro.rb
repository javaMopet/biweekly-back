class CreateDetallesRegistro < ActiveRecord::Migration[7.0]
  def change
    create_table :detalles_registro do |t|
      t.references :registro, null: false, foreign_key: true
      t.string :registrable_type
      t.integer :registrable_id
      t.string :observaciones
      t.string :tipo_afectacion, limit: 1
      t.references :cuenta_contable, null: false, foreign_key: true
      t.decimal :importe_absoluto, precision: 10, scale: 2
      t.decimal :importe_real, precision: 10, scale: 2

      t.timestamps
    end
  end
end
