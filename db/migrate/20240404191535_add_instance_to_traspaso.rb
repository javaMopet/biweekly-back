class AddInstanceToTraspaso < ActiveRecord::Migration[7.0]
  # Agregar campo instancia a traspasos
  def change
    add_reference :traspasos, :instance, null: false, foreign_key: true, default: 1
  end
end
