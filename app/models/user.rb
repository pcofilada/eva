class User < ApplicationRecord
  has_many :parkings
  has_many :parkings, through: :parking_histories
end
