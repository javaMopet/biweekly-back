# frozen_string_literal: true

# Creación de la tabla de categorias
class CreateCategorias < ActiveRecord::Migration[7.0]
  def change
    create_table :categorias do |t|
      t.string :nombre, limit: 200
      t.string :icono, limit: 50
      t.string :descripcion
      t.string :color, limit: 20
      # t.references :tipo_movimiento, null: false, foreign_key: true
      t.references :cuenta_contable, null: false, foreign_key: true

      t.timestamps
    end
  end
end
