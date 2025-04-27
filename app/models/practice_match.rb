class PracticeMatch < ApplicationRecord
  has_many :practice_matches_prefectures, dependent: :destroy
  has_many :prefecture_tags, through: :practice_matches_prefectures

  has_many :practice_matches_cities, dependent: :destroy
  has_many :city_tags, through: :practice_matches_cities
  belongs_to :user
  def self.ransackable_attributes(auth_object = nil)
    ["place", "schedule", "prefecture", "city", "sports", "genre_generation"]
  end
end
