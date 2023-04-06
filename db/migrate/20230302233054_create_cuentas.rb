class CreateCuentas < ActiveRecord::Migration[7.0]
  def change
    create_table :cuentas do |t|
      t.string :nombre, limit: 100
      t.string :descripcion
      # t.references :tipo_cuenta, null: false, foreign_key: true
      t.references :cuenta_contable, null: false, foreign_key: true

      t.timestamps
    end
  end
end
