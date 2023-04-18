class CreateEstadosRegistro < ActiveRecord::Migration[7.0]
  def change
    create_table :estados_registro do |t|
      t.string :nombre, limit: 100

      t.timestamps
    end
  end
end
