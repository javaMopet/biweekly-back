class AddUserToCuenta < ActiveRecord::Migration[7.0]
  # Agregar campo user_id a tabla cuentas
  def change
    add_reference :cuentas, :user, null: false, foreign_key: true, default: 1
  end
end
