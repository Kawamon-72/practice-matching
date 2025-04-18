class CreateProfileSports < ActiveRecord::Migration[8.0]
  def change
    create_table :profile_sports do |t|
      t.integer :profile_id
      t.integer :sports_tags_id

      t.timestamps
    end
  end
end
