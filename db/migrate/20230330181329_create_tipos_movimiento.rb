# frozen_string_literal: true

# Creación de la tabla de tipos de movimiento
class CreateTiposMovimiento < ActiveRecord::Migration[7.0]
  def change
    create_table :tipos_movimiento do |t|
      t.string :nombre, limit: 50
      t.string :icono, limit: 50

      t.timestamps
    end
  end
end
