class AddIconoToTipoMovimiento < ActiveRecord::Migration[7.0]
  def change
    add_column :tipos_movimiento, :icono, :string, limit: 50
  end
end
