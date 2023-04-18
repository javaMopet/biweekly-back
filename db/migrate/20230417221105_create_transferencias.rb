class CreateTransferencias < ActiveRecord::Migration[7.0]
  def change
    create_table :transferencias do |t|
      t.references :cuenta_origen, null: false, foreign_key: { to_table: :cuentas }
      t.references :cuenta_destino, null: false, foreign_key: { to_table: :cuentas }
      t.string :observaciones

      t.timestamps
    end
  end
end
