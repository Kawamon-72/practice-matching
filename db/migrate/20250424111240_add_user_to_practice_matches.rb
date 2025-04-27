class AddUserToPracticeMatches < ActiveRecord::Migration[8.0]
  def change
    add_reference :practice_matches, :user, foreign_key: true
  end
end
