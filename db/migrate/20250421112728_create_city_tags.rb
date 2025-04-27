class CreateCityTags < ActiveRecord::Migration[8.0]
  def change
    create_table :city_tags do |t|
      t.string :name

      t.timestamps
    end
  end
end
