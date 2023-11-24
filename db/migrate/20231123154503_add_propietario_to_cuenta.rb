class AddPropietarioToCuenta < ActiveRecord::Migration[7.0]
  def change
    add_column :cuentas, :propietario, :string, limit: 80
  end
end
