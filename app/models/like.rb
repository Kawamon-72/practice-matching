class Like < ApplicationRecord
  belongs_to :user
  belongs_to :practice_match

  # enum like_status: { matched: 0 }
end
