class AddUserToBanco < ActiveRecord::Migration[7.0]
  # Agregar usuario a tabla bancos.
  def change
    add_reference :bancos, :user, null: false, foreign_key: true, default: 1
  end
end
