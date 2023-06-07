# frozen_string_literal: true

# Creacion de la tabla de transferencias
class CreateTransferencias < ActiveRecord::Migration[7.0]
  def change
    create_table :transferencias do |t|
      t.references :tipo_cuenta_transferencia, null: false, foreign_key: true

      t.timestamps
    end
  end
end
