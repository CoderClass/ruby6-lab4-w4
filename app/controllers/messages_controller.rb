class MessagesController < ApplicationController
  def index
    @room = Room.find(params[:room_id])
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      # respond_to :js
      redirect_to room_messages_path(@room)
    end
  end
  private
  def message_params
    params.require(:message).permit(:username, :content)
  end
end
