class CreateClasificaciones < ActiveRecord::Migration[7.0]
  # main method
  def change
    create_table :clasificaciones do |t|
      t.string :nombre
      t.string :color
      t.references :instance, null: false, foreign_key: true

      t.timestamps
    end
  end
end
