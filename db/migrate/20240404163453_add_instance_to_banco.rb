class AddInstanceToBanco < ActiveRecord::Migration[7.0]
  # change table bancos
  def change
    add_reference :bancos, :instance, null: false, foreign_key: true, default: 1
  end
end
