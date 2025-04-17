class ProfileGenreGeneration < ApplicationRecord
  belongs_to :genre_generation_tag
  belongs_to :profile
end
