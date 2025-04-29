class CreateLikes < ActiveRecord::Migration[8.0]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :practice_match, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
