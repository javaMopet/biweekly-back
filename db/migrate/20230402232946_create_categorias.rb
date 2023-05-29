# frozen_string_literal: true

# Creación de la tabla de categorias
class CreateCategorias < ActiveRecord::Migration[7.0]
  def change
    create_table :categorias do |t|
      t.references :tipo_movimiento, null: false, foreign_key: true
      t.integer :orden, null: false
      t.string :nombre, limit: 200, null: false
      t.string :icono, limit: 50
      t.string :descripcion, limit: 1000
      t.string :color, limit: 20
      t.references :cuenta_contable, null: true, foreign_key: true
      t.references :cuenta_default, null: true, foreign_key: { to_table: :cuentas }
      t.decimal :importe_default, precision: 10, scale: 4, null: true, default: 0.00

      t.timestamps
    end
  end
end
