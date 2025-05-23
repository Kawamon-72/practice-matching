class Like < ApplicationRecord
  belongs_to :user
  belongs_to :practice_match
  belongs_to :liked_user, class_name: 'User'
  # enum like_status: { matched: 0 }
  def self.matched_users(user)
    where(user_id: user.id).pluck(:liked_user_id) & where(liked_user_id: user.id).pluck(:user_id)
  end
end
