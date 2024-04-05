class AddInstanceToUser < ActiveRecord::Migration[7.0]
  # change table users
  def change
    add_reference :users, :instance, null: false, foreign_key: true, default: 1
  end
end
