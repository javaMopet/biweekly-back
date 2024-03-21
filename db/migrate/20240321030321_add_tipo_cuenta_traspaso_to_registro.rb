class AddTipoCuentaTraspasoToRegistro < ActiveRecord::Migration[7.0]
  def change
    add_reference :registros, :tipo_cuenta_traspaso, null: true, foreign_key: true, default: nil
  end
end
