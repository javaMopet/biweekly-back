class CreateTiposCategoria < ActiveRecord::Migration[7.0]
  def change
    create_table :tipos_categoria do |t|
      t.string :nombre, limit: 20
      t.string :tipo_afectacion, limit: 1

      t.timestamps
    end
  end
end
