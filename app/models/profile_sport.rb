class ProfileSport < ApplicationRecord
  belongs_to :sports_tag
  belongs_to :profile
end
