class ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.joins(:chat_messages)
                          .where(chat_messages: { user_id: current_user.id })
                          .distinct
                          .includes(:practice_match)
  end

  def find_or_create
    practice_match = PracticeMatch.find(params[:practice_match_id])
  
    @chat_room = ChatRoom.find_or_create_by(practice_match: practice_match)
  
    redirect_to chat_room_path(@chat_room)
  end
  
  def show
    @chat_room = ChatRoom.find(params[:id])
    @chat_messages = @chat_room.chat_messages.includes(:user).order(created_at: :asc)
    @chat_message = ChatMessage.new
    @current_user_id = current_user.id
  end
end
