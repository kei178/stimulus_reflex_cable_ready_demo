# frozen_string_literal: true

class MessagesReflex < ApplicationReflex
  def like
    message = Message.find(element.dataset[:id])
    message.increment! :like_count
  end
end
