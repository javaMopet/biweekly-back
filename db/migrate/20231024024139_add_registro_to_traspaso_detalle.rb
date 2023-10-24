class AddRegistroToTraspasoDetalle < ActiveRecord::Migration[7.0]
  def change
    add_reference :traspaso_detalles, :registro, null: false, foreign_key: true
  end
end
