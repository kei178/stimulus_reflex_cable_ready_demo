# frozen_string_literal: true

class MessagesReflex < ApplicationReflex
  # include CableReady::Broadcaster

  def like
    message = Message.find(element.dataset[:id])
    message.increment! :like_count
    # cable_ready['message'].text_content(
    #   selector: "#message-#{message.id}-likes",
    #   text: message.like_count
    # )
    # cable_ready.broadcast
  end
end
