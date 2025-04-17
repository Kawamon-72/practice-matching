class GenreGenerationTag < ApplicationRecord
  has_many :profile_genre_generations
  has_many :profiles, through: :profile_genre_generations

  validates :name, presence: true, if: -> { new_record? || change[:name] }
end
