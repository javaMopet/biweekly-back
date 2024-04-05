class CreateInstances < ActiveRecord::Migration[7.0]
  def change
    create_table :instances do |t|
      t.string :name, null: false
      t.string :logo_image, null: false

      t.timestamps
    end
  end
end
