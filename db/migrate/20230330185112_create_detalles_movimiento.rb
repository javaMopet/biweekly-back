# frozen_string_literal: true

# Creación de la tabla de Detalles de Movimiento
class CreateDetallesMovimiento < ActiveRecord::Migration[7.0]
  def change
    create_table :detalles_movimiento do |t|
      t.references :movimiento, null: false, foreign_key: true
      t.references :categoria, null: true, foreign_key: true
      t.references :cuenta, null: true, foreign_key: true
      t.decimal :importe, precision: 10, scale: 4
      t.string :tipo_afectacion, limit: 1
      t.string :tipo_detalle, limit: 1
      t.references :cuenta_contable, null: false, foreign_key: true

      t.timestamps
    end
  end
end
