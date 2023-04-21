# frozen_string_literal: true

# Agregar importe a Categorias
class AddImporteToCategoria < ActiveRecord::Migration[7.0]
  def change
    add_column :categorias, :importe, :decimal, precision: 10, scale: 4, null: false, default: 0.00
  end
end
