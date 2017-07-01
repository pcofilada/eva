class AddContactToParking < ActiveRecord::Migration[5.1]
  def change
    add_column :parkings, :contact, :string
  end
end
