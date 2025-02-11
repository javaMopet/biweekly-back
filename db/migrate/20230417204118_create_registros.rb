# frozen_string_literal: true

# Creación de la tabla de registros
class CreateRegistros < ActiveRecord::Migration[7.0]
  def change
    create_table :registros do |t|
      t.references :estado_registro, null: false, foreign_key: true
      t.string :tipo_afectacion, limit: 1, null: false
      t.decimal :importe, precision: 10, scale: 4, null: false
      t.date :fecha, null: false
      t.references :categoria, null: true, foreign_key: true
      t.string :observaciones, limit: 1000, null: true
      t.references :cuenta, null: true, foreign_key: true
      # t.references :tipo_cuenta_transferencia, null: true, foreign_key: true

      t.timestamps
    end
  end
end
