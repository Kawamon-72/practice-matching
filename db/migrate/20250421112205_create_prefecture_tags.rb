class CreatePrefectureTags < ActiveRecord::Migration[8.0]
  def change
    create_table :prefecture_tags do |t|
      t.string :name

      t.timestamps
    end
  end
end
