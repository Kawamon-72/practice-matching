class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  has_many :own_practice_matches, class_name: 'PracticeMatch'
  has_many :likes
  has_many :liked_practice_matches, through: :likes, source: :practice_match
  has_many :user_practice_matches
  has_many :joined_practice_matches, through: :user_practice_matches, source: :practice_match
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  has_many :notification_practice_matches, through: :notifications, source: :practice_match
  has_many :likes, foreign_key: :user_id
  has_many :liked_users, through: :likes, source: :liked_user
  has_many :reverse_likes, class_name: 'Like', foreign_key: :liked_user_id
  has_many :liking_users, through: :reverse_likes, source: :user
  has_many :chat_room_users
  has_many :chat_rooms, through: :chat_room_users
  has_many :chat_messages
  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications

  authenticates_with_sorcery!

  validates :password, presence: true, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, presence: true, uniqueness: true
  validates :reset_password_token, uniqueness: true, allow_nil: true

  def self.ransackable_attributes(auth_object = nil)
    ["id", "email", "created_at", "updated_at"] # 必要なものだけ許可。crypted_passwordなどは含めない
  end

  def self.ransackable_associations(auth_object = nil)
    ["profile"]
  end

  def self.create_from(provider)
    auth = get_authentication_info(provider)

    user = User.new(email: auth[:email])
    user.save!

    user.create_profile(name: auth[:name]) if user.persisted?

    user.authentications.create!(
      provider: provider,
      uid: auth[:uid]
    )

    user
  end

  def self.get_authentication_info(provider)
    access_token = Sorcery::Controller::Config.send("build_access_token_for_#{provider}")
    user_info = access_token.get("https://www.googleapis.com/oauth2/v3/userinfo").parsed

    {
      uid: user_info["sub"],
      email: user_info["email"],
      name: user_info["name"]
    }
  end
end
