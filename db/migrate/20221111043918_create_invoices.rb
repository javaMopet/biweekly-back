class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.string :name
      t.string :name_file
      t.binary :xml_file

      t.timestamps
    end
  end
end
