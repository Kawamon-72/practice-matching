class Notification < ApplicationRecord
  belongs_to :visitor, class_name: 'User'
  belongs_to :visited, class_name: 'User'
  belongs_to :practice_match

  validates :visitor_id, :visited_id, :practice_match_id, :action, presence: true
end
