class UserPracticeMatch < ApplicationRecord
  belongs_to :user
  belongs_to :practice_match
end