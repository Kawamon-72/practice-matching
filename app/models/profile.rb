class Profile < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  belongs_to :user

  has_many :profile_genre_generations, dependent: :destroy
  has_many :genre_generation_tags, through: :profile_genre_generations, class_name: 'GenreGenerationTag'

  has_many :profile_sports, dependent: :destroy
  has_many :sports_tags, through: :profile_sports, class_name: 'SportsTag'
  validates :name, presence: true, if: -> { new_record? || change[:name] }
  validates :location, presence: true, if: -> { new_record? || changes[:location] }
  validates :introduction, presence: true, if: -> { new_record? || changes[:introduction] }
end
