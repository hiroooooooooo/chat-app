class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
  end

  def create
    @room = Room.find(params[:room_id])
    # binding.pry
    # message_params の値が見たい
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
      # redirect_to /rooms/#{@room.id}/messages ←多分こんな感じ
    else
      render :index
    end
  end

  private
  
  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end
