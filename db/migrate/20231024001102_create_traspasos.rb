class CreateTraspasos < ActiveRecord::Migration[7.0]
  def change
    create_table :traspasos do |t|
      t.date :fecha
      t.string :observaciones, limit: 300
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
