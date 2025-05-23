class AddLikedUserIdToLikes < ActiveRecord::Migration[8.0]
  def change
    add_column :likes, :liked_user_id, :bigint
    add_foreign_key :likes, :users, column: :liked_user_id
    add_index :likes, :liked_user_id
  end
end
