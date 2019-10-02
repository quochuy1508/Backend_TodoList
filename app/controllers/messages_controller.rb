class MessagesController < ApplicationController

  def index
    @messages = @conversation.messages
    json_response(@messages)
  end

  def create
    if @messages.save
      json_response(@conversation)
    else
      response = { message: Message.message_not_send }
      json_response(response, :created)
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :from_id, :to_id)
  end

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end
end
