class MessagesController < ApplicationController
  include CableReady::Broadcaster

  def index
    @messages = Message.all.order(created_at: :desc)
    @message = Message.new
  end

  def create
    message = Message.create(message_params)
    cable_ready['message'].insert_adjacent_html(
      selector: '#messages',
      position: 'afterbegin',
      html: render_to_string(partial: 'message', locals: { message: message })
    )
    cable_ready.broadcast

    redirect_to messages_path
  end

  private

  def message_params
    params.require(:message).permit(:username, :body)
  end
end
