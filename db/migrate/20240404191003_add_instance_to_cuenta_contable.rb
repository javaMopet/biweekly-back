class AddInstanceToCuentaContable < ActiveRecord::Migration[7.0]
  # Change table cuentas_contable
  def change
    add_reference :cuentas_contable, :instance, null: false, foreign_key: true, default: 1
  end
end
