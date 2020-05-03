class MessagesController < ApplicationController
  def index
    @messages = Message.all.order(created_at: :desc)
    @message = Message.new
  end

  def create
    Message.create(message_params)
    redirect_to messages_path
  end

  private

  def message_params
    params.require(:message).permit(:username, :body)
  end
end
