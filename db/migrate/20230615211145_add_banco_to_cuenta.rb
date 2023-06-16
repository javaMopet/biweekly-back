class AddBancoToCuenta < ActiveRecord::Migration[7.0]
  def change
    add_reference :cuentas, :banco, null: true, foreign_key: true, default: nil
  end
end
