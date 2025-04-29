class CreateUserPracticeMatches < ActiveRecord::Migration[8.0]
  def change
    create_table :user_practice_matches do |t|
      t.references :user, foreign_key: true
      t.references :practice_match, foreign_key: true
      t.timestamps
    end
  end
end
