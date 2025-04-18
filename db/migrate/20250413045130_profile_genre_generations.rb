class ProfileGenreGenerations < ActiveRecord::Migration[8.0]
  def change
    change_column_null :profile_genre_generations, :profile_id, false
    change_column_null :profile_genre_generations, :genre_generation_tag_id, false

    add_foreign_key :profile_genre_generations, :profiles
    add_foreign_key :profile_genre_generations, :genre_generation_tags
  end
end
