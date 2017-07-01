class User < ApplicationRecord
  has_many :parking_histories
  has_many :parkings, through: :parking_histories
end
