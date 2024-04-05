class AddInstanceToCategoria < ActiveRecord::Migration[7.0]
  # Change table categorias
  def change
    add_reference :categorias, :instance, null: false, foreign_key: true, default: 1
  end
end
