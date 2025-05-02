class RemoveNumberOfAcceptFromPracticeMatches < ActiveRecord::Migration[8.0]
  def change
    remove_column :practice_matches, :number_of_accept, :integer
  end
end
