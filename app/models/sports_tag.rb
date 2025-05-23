class SportsTag < ApplicationRecord
  has_many :profile_sports
  has_many :profiles, through: :profile_sports

  validates :name, presence: true, if: -> { new_record? || change[:name] }

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end
