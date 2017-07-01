class CreateParkingHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :parking_histories do |t|
      t.integer :user_id
      t.integer :parking_id

      t.timestamps
    end
  end
end
