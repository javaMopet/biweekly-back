class AddOrdenToCategoria < ActiveRecord::Migration[7.0]
  def change
    add_column :categorias, :orden, :integer, null: false, default: 1000
  end
end
