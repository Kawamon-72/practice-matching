class PrefectureTag < ApplicationRecord
  has_many :practice_matches_prefectures, dependent: :destroy
  has_many :practice_matches, through: :practice_matches_prefectures
end
