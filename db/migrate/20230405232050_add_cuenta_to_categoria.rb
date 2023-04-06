class AddCuentaToCategoria < ActiveRecord::Migration[7.0]
  def change
    add_reference :categorias, :cuenta, null: true, foreign_key: true
  end
end
