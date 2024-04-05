class AddInstanceToCuenta < ActiveRecord::Migration[7.0]
  # Agregar campo instancia a tabla cuentas
  def change
    add_reference :cuentas, :instance, null: false, foreign_key: true, default: 1
  end
end
