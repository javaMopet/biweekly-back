class CreateMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :menus do |t|
      t.string :nombre, limit: 30
      t.string :icono, limit: 30
      t.string :ruta, limit: 150
      t.integer :padre, limit: 2
      t.boolean :tiene_hijos
      t.integer :orden, limit: 2
      t.boolean :activo
      t.string :ruta_vista

      t.timestamps
    end
  end
end
