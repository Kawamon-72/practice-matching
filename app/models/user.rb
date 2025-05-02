class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  has_many :own_practice_matches, class_name: 'PracticeMatch'
  has_many :likes
  has_many :liked_practice_matches, through: :likes, source: :practice_match
  has_many :user_practice_matches
  has_many :joined_practice_matches, through: :user_practice_matches, source: :practice_match

  authenticates_with_sorcery!

  validates :password, presence: true, length: { minimum: 3 }, if: -> { new_record? || change[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, presence: true, uniqueness: true
end
