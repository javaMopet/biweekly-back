class AddTipoCuentaToCuenta < ActiveRecord::Migration[7.0]
  def change
    add_reference :cuentas, :tipo_cuenta, null: false, foreign_key: true
  end
end
