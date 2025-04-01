class CreatePracticeMatches < ActiveRecord::Migration[8.0]
  def change
    create_table :practice_matches do |t|
      t.date :schedule
      t.text :place
      t.integer :number_of_accept
      t.text :remarks

      t.timestamps
    end
  end
end
