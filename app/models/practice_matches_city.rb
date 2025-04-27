class PracticeMatchesCity < ApplicationRecord
  belongs_to :city_tag
  belongs_to :practice_match
end
