class PrefectureTag < ApplicationRecord
  has_many :practice_matches_prefectures, dependent: :destroy
  has_many :practice_matches, through: :practice_matches_prefectures

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end
