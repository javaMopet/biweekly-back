class AddIconoToTipoCuenta < ActiveRecord::Migration[7.0]
  def change
    add_column :tipos_cuenta, :icono, :string, limit: 30
  end
end
