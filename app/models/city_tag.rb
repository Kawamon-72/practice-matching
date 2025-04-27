class CityTag < ApplicationRecord
  has_many :practice_matches_cities, dependent: :destroy
  has_many :practice_matches, through: :practice_matches_cities
end
