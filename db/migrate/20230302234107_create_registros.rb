class CreateRegistros < ActiveRecord::Migration[7.0]
  def change
    create_table :registros do |t|
      t.string :observaciones
      t.string :comentarios
      t.date :fecha_transaccion
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
