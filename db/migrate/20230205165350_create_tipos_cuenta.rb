# frozen_string_literal: true

# Creación de la tabla de tipos de cuenta
class CreateTiposCuenta < ActiveRecord::Migration[7.0]
  def change
    create_table :tipos_cuenta do |t|
      t.string :nombre, limit: 50, null: false
      t.string :icono, limit: 50, null: false

      t.timestamps
    end
  end
end
