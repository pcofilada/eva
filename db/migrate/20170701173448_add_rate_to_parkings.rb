class AddRateToParkings < ActiveRecord::Migration[5.1]
  def change
    add_column :parkings, :initial_rate, :integer
    add_column :parkings, :succeeding_rate, :integer
  end
end
