class RemoveInstanceFromUser < ActiveRecord::Migration[7.0]
  # main method to remove the reference to instance from users
  def change
    remove_reference :users, :instance, null: false, foreign_key: true
  end
end
