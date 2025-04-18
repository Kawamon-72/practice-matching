class ProfileGenreGenarations < ActiveRecord::Migration[8.0]
  def change
    create_table :profile_genre_generations do |t|
      t.integer :profile_id
      t.integer :genre_generation_tag_id

      t.timestamps
    end
  end
end
