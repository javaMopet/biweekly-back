class CreateUserInstances < ActiveRecord::Migration[7.0]
  # This migration creates a join table for users and instances
  def change
    create_table :users_instances do |t|
      t.references :user, null: false, foreign_key: true
      t.references :instance, null: false, foreign_key: true

      t.timestamps
    end
  end
end
