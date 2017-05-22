class Api::V1::Conversations::MessagesController < Api::V1::Conversations::BaseController
  before_action :set_conversation, only: [:index, :create]
  before_action :set_message_params, only: [:create]

  def index
    @conversation.messages
  end

  def create
    @conversation.messages.create(@message_params)
  end

  private

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def set_message_params
    @message_params =
        {
            user_id: @current_user.id, message: params[:message]
        }
  end
end