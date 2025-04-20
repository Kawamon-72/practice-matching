class AddAvatarToProfiles < ActiveRecord::Migration[8.0]
  def change
    add_column :profiles, :avatar, :string
  end
end
