# frozen_string_literal: true

# Creacion de la tabla de egresos
class CreateEgresos < ActiveRecord::Migration[7.0]
  def change
    create_table :egresos do |t|
      t.references :categoria, null: false, foreign_key: true

      t.timestamps
    end
  end
end
