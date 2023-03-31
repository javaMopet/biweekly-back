# frozen_string_literal: true

# Creación de la tabla de Cuentas Contables
class CreateCuentasContable < ActiveRecord::Migration[7.0]
  def change
    create_table :cuentas_contable do |t|
      t.string :nombre, limit: 100
      t.string :tipo_afectacion, limit: 1
      t.integer :subnivel
      t.references :padre, null: true, foreign_key: { to_table: :cuentas_contable }

      t.timestamps
    end
  end
end
