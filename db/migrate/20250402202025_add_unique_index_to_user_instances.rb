class AddUniqueIndexToUserInstances < ActiveRecord::Migration[7.0]
  # This migration adds a unique index to the join table users_instances
  # to ensure that each user can only have one instance associated with them
  # and vice versa.
  #
  # The index is created on the combination of user_id and instance_id columns.
  def change
    add_index :users_instances, [:user_id, :instance_id], unique: true
  end
end
