class PracticeMatch < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["place", "schedule", "prefecture", "city", "sports", "genre_generation"]
  end
end
