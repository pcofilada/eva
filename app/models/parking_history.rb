class ParkingHistory < ApplicationRecord
  belongs_to :user
  belongs_to :parking
end
