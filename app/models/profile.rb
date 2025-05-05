class Profile < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  belongs_to :user

  has_many :profile_genre_generations, dependent: :destroy
  has_many :genre_generation_tags, through: :profile_genre_generations, class_name: 'GenreGenerationTag'

  has_many :profile_sports, dependent: :destroy
  has_many :sports_tags, through: :profile_sports, class_name: 'SportsTag'
  validates :name, presence: true, if: -> { new_record? || changes[:name].present? }
  validates :location, presence: true, if: -> { new_record? || changes[:location].present? }
  validates :introduction, presence: true, if: -> { new_record? || changes[:introduction].present? }

  def self.ransackable_attributes(auth_object = nil)
    ["id", "user_id"] # 基本属性を追加（必要に応じて拡張）
  end

  def self.ransackable_associations(auth_object = nil)
    ["genre_generation_tags"]
  end
end
