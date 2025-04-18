class FixProfileSportsColumns < ActiveRecord::Migration[8.0]
  def change
    rename_column :profile_sports, :sports_tags_id, :sports_tag_id

    # 外部キー追加
    add_foreign_key :profile_sports, :profiles
    add_foreign_key :profile_sports, :sports_tags
  end
end
