class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user)
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
      # @messagesがないとindexを構成する素材が足りないので、ここで記述する
      @messages = @room.messages.includes(:user)
      render :index
    end
  end

  private
  
  def message_params
    # :imageの追加。これでimageという名前で送られてきた画像ファイルの保存を許可できる
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end
