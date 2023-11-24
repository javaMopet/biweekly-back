class AddDiasGraciaToCuenta < ActiveRecord::Migration[7.0]
  def change
    add_column :cuentas, :dias_gracia, :integer, null: false, default: 0
  end
end
