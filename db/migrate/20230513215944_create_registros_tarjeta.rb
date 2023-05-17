# frozen_string_literal: true

# Tabla de registros de un tarjeta de crédito
class CreateRegistrosTarjeta < ActiveRecord::Migration[7.0]
  def change
    create_table :registros_tarjeta do |t|
      t.date :fecha
      t.string :concepto
      t.references :categoria, null: false, foreign_key: true
      t.decimal :importe, precision: 10, scale: 4

      t.timestamps
    end
  end
end
