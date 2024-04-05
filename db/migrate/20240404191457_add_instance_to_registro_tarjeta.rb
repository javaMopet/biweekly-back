class AddInstanceToRegistroTarjeta < ActiveRecord::Migration[7.0]
  # Agregar campo instancia a registros_tarjeta
  def change
    add_reference :registros_tarjeta, :instance, null: false, foreign_key: true, default: 1
  end
end
