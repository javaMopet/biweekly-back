class CreateRegistros < ActiveRecord::Migration[7.0]
  def change
    create_table :registros do |t|
      t.references :estado_registro, null: false, foreign_key: true
      t.string :registrable_type, limit: 100
      t.bigint :registrable_id
      t.decimal :importe, precision: 10, scale: 4
      t.date :fecha

      t.timestamps
    end
  end
end
