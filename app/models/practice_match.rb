class PracticeMatch < ApplicationRecord
  belongs_to :user
  has_one :profile, through: :user
  has_one :chat_room
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
  has_many :profile_sports_tags, through: :profile, source: :sports_tags
  has_many :profile_genre_generation_tags, through: :profile, source: :genre_generation_tags

  validates :user, presence: true

  attr_accessor :prefecture_tag_name, :city_tag_name
  def self.ransackable_attributes(auth_object = nil)
    ["schedule", "sports", "genre_generation"]
  end
  
  def self.ransackable_associations(auth_object = nil)
    ["prefecture_tags", "city_tags", "user", "profile", "profile_sports_tags", "profile_genre_generation_tags"]
  end
end
