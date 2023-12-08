# frozen_string_literal: true

# Creacion de la tabla cuentas
class CreateCuentas < ActiveRecord::Migration[7.0]
  # migration method
  def change
    create_table :cuentas do |t|
      t.string :nombre, limit: 100
      t.string :identificador, limit: 10, null: true
      t.references :tipo_cuenta, null: false, foreign_key: true
      t.references :cuenta_contable, null: false, foreign_key: true
      t.references :banco, null: true, foreign_key: true
      t.decimal :saldo, precision: 10, scale: 4, null: false, default: 0
      t.integer :dia_corte, null: true

      t.timestamps
    end
  end
end
