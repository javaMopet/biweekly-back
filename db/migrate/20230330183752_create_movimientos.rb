# frozen_string_literal: true

# Creación de la tabla de movimientos
class CreateMovimientos < ActiveRecord::Migration[7.0]
  def change
    create_table :movimientos do |t|
      t.integer :numero
      t.references :estado_movimiento, null: false, foreign_key: true
      t.references :tipo_movimiento, null: false, foreign_key: true
      t.date :fecha
      t.string :observaciones, limit: 300
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
