class AddContactToParking < ActiveRecord::Migration[5.1]
  def change
    add_column :parking, :contact, :string
  end
end
