class CreatePracticeMatchesPrefectures < ActiveRecord::Migration[8.0]
  def change
    create_table :practice_matches_prefectures do |t|
      t.references :practice_match, null: false, foreign_key: true
      t.references :prefecture_tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
