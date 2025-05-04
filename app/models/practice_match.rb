class PracticeMatch < ApplicationRecord
  has_many :practice_matches_prefectures, dependent: :destroy
  has_many :prefecture_tags, through: :practice_matches_prefectures
  has_many :likes
  has_many :users, through: :likes
  has_many :user_practice_matches
  has_many :users, through: :user_practice_matches
  has_many :practice_matches_cities, dependent: :destroy
  has_many :city_tags, through: :practice_matches_cities
  has_many :notification_users, through: :notifications, source: :user
  has_many :notifications, dependent: :destroy
  belongs_to :user
  validates :user, presence: true

  attr_accessor :prefecture_tag_name, :city_tag_name
  def self.ransackable_attributes(auth_object = nil)
    ["place", "schedule", "prefecture", "city", "sports", "genre_generation"]
  end
end
