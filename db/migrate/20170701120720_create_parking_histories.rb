class CreateParkingHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :parking_histories do |t|
      t.datetime :datetime

      t.timestamps
    end
  end
end
