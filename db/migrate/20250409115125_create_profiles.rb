class CreateProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :name
      t.string :location
      t.text :introduction

      t.timestamps
    end
  end
end
