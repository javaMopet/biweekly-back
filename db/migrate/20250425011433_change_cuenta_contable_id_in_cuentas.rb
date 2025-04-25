class ChangeCuentaContableIdInCuentas < ActiveRecord::Migration[7.0]
  # funcion para hacer el cambio de columna
  def change
    change_column :cuentas, :cuenta_contable_id, :bigint, null: true
  end
end
