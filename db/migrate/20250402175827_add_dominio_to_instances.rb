class AddDominioToInstances < ActiveRecord::Migration[7.0]
  # main method
  def change
    add_column :instances, :dominio, :string, limit: 20
  end
end
