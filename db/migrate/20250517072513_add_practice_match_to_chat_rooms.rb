class AddPracticeMatchToChatRooms < ActiveRecord::Migration[8.0]
  def change
    add_reference :chat_rooms, :practice_match, null: false, foreign_key: true
  end
end
