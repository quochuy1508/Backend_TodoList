class ConversationChannel < ApplicationCable::Channel
  # calls when a client connects to the server
  def subscribed
    conversation = Conversation.find(params[:id])
    stream_for conversation
  end

  def unsubscribed

  end
end