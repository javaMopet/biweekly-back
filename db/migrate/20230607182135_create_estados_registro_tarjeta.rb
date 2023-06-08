class CreateEstadosRegistroTarjeta < ActiveRecord::Migration[7.0]
  def change
    create_table :estados_registro_tarjeta do |t|
      t.string :nombre, limit: 20

      t.timestamps
    end
  end
end
