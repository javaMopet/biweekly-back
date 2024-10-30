class AddInstanceToRegistro < ActiveRecord::Migration[7.0]
  def change
    add_reference :registros, :instance, null: false, foreign_key: true, default: 1
  end
end
