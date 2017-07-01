class CreateParkings < ActiveRecord::Migration[5.1]
  def change
    create_table :parkings do |t|
      t.string :name
      t.string :address
      t.string :region
      t.string :barangay
      t.string :city
      t.string :lat
      t.string :long
      t.integer :slots

      t.timestamps
    end
  end
end
