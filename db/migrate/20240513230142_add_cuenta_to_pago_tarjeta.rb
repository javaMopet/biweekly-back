class AddCuentaToPagoTarjeta < ActiveRecord::Migration[7.0]
  # main method
  def change
    add_reference :pagos_tarjeta, :cuenta, null: false, foreign_key: true, default: 1
  end
end
