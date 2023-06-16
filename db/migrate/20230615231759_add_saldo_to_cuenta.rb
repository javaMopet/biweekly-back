class AddSaldoToCuenta < ActiveRecord::Migration[7.0]
  def change
    add_column :cuentas, :saldo, :decimal, precision: 10, scale: 4, null: false, default: 0
  end
end
