class AddRegistroTarjetaToRegistro < ActiveRecord::Migration[7.0]
  # main method
  def change
    add_reference :registros, :registro_tarjeta, null: true, foreign_key: true
  end
end
