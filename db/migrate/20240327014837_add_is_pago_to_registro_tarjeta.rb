class AddIsPagoToRegistroTarjeta < ActiveRecord::Migration[7.0]
  def change
    add_column :registros_tarjeta, :is_pago, :boolean, null: true
  end
end
