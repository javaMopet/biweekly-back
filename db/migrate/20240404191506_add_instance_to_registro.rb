class AddInstanceToRegistro < ActiveRecord::Migration[7.0]
  # Agregar campo instancia a registros
  def change
    add_reference :registros, :instance, null: false, foreign_key: true, default: 1
  end
end
