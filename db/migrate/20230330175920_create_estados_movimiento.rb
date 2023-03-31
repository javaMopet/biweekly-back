class CreateEstadosMovimiento < ActiveRecord::Migration[7.0]
  def change
    create_table :estados_movimiento do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
