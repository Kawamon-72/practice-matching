class CreatePracticeMatchesCities < ActiveRecord::Migration[8.0]
  def change
    create_table :practice_matches_cities do |t|
      t.references :practice_match, null: false, foreign_key: true
      t.references :city_tag, null: false, foreign_key: true


      t.timestamps
    end
  end
end
