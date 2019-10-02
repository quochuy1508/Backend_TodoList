class ConversationsController < ApplicationController
  skip_before_action :authorize_request, only: :index

  def index
    @conversations = Conversation.all
    json_response(@conversations)
  end

  def create
    to_id = params[:to_id]
    from_id = params[:from_id]

    if Conversation.where(to_id, from_id).presence?
      @conversation = Conversation.from_or_to.first
    else
      @conversation = Conversation.create(conversation_params)
    end
  end

  private

  def conversation_params
    params.permit(:to_id, :from_id)
  end
end
