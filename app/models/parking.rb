class Parking < ApplicationRecord
  has_many :parking_histories
  has_many :users, through: :parking_histories
end
