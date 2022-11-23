class CreateCfdis < ActiveRecord::Migration[7.0]
  def change
    create_table :cfdis do |t|
      t.string :uuid
      t.string :rfc_emisor
      t.string :rfc_receptor

      t.timestamps
    end
  end
end
