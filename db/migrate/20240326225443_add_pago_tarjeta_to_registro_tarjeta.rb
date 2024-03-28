class AddPagoTarjetaToRegistroTarjeta < ActiveRecord::Migration[7.0]
  def change
    add_reference :registros_tarjeta, :pago_tarjeta, null: true, foreign_key: true, default: nil
  end
end
