# frozen_string_literal: true

# Agregamos el campo de dia de corte para cuentas
class AddDiaCorteToCuenta < ActiveRecord::Migration[7.0]
  def change
    add_column :cuentas, :dia_corte, :integer, null: true
  end
end
