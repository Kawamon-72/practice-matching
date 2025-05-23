class ChatRoom < ApplicationRecord
  belongs_to :practice_match
  has_many :chat_messages
  has_many :chat_room_users
  has_many :users, through: :chat_room_users 
end
