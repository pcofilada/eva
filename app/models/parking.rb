class Parking < ApplicationRecord
  has_many :parking_histories
  has_many :users, through: :parking_histories
  acts_as_mappable :default_units => :miles,
                    :default_formula => :sphere,
                    :distance_field_name => :distance,
                    :lat_column_name => :lat,
                    :lng_column_name => :long
end

