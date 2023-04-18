class CreateEgresos < ActiveRecord::Migration[7.0]
  def change
    create_table :egresos do |t|
      t.references :categoria, null: false, foreign_key: true
      t.references :cuenta, null: false, foreign_key: true
      t.string :observaciones

      t.timestamps
    end
  end
end
