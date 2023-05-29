# frozen_string_literal: true

# Creacion de la tabla de tipos de cuenta para transferencia(entrada o salida)
class CreateTiposCuentaTransferencia < ActiveRecord::Migration[7.0]
  def change
    create_table :tipos_cuenta_transferencia do |t|
      t.string :nombre, limit: 100

      t.timestamps
    end
  end
end
