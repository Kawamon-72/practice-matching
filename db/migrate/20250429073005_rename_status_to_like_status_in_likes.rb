class RenameStatusToLikeStatusInLikes < ActiveRecord::Migration[8.0]
  def change
    rename_column :likes, :status, :like_status
  end
end
