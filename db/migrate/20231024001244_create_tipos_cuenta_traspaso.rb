class CreateTiposCuentaTraspaso < ActiveRecord::Migration[7.0]
  def change
    create_table :tipos_cuenta_traspaso do |t|
      t.string :nombre, limit: 100

      t.timestamps
    end
  end
end
