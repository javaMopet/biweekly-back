class CreateTiposMovimiento < ActiveRecord::Migration[7.0]
  def change
    create_table :tipos_movimiento do |t|
      t.string :nombre, limit: 20

      t.timestamps
    end
  end
end
