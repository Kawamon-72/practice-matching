class CreateChatRooms < ActiveRecord::Migration[8.0]
  def change
    create_table :chat_rooms do |t|
      t.references :practice_match, null: false, foreign_key: true

      t.timestamps
    end
  end
end
