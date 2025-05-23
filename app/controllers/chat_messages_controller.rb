class ChatMessagesController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_chat_room

  def index
    @chat_message = ChatMessage.new
  end

  def create
    @chat_message = @chat_room.chat_messages.new(chat_message_params)
    @chat_message.user = current_user
  
    respond_to do |format|
      if @chat_message.save
        format.turbo_stream
        format.html { redirect_to @chat_room }
      else
        format.html { render "chat_rooms/show", status: :unprocessable_entity }
      end
    end
  end
  
  private
  
  def set_chat_room
    @chat_room = ChatRoom.find(params[:chat_room_id])
  end
  
  def chat_message_params
    params.require(:chat_message).permit(:content)
  end
end
