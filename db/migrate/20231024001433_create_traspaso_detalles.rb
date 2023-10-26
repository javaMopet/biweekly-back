class CreateTraspasoDetalles < ActiveRecord::Migration[7.0]
  # Creacion de tabla
  def change
    create_table :traspaso_detalles do |t|
      t.references(:traspaso, null: false, foreign_key: true)
      t.references :cuenta, null: false, foreign_key: true
      t.references :tipo_cuenta_traspaso, null: true, foreign_key: true
      t.decimal :importe, precision: 11, scale: 4

      t.timestamps
    end
  end
end
