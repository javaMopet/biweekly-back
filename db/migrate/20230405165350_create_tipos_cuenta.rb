class CreateTiposCuenta < ActiveRecord::Migration[7.0]
  def change
    create_table :tipos_cuenta do |t|
      t.string :nombre, limit: 30

      t.timestamps
    end
  end
end
