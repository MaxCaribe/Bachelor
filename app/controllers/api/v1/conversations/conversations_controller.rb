class Api::V1::ConversationsController < Api::V1::Conversations::BaseController
  before_action :set_conversation, only: [:show]

  def index
    @conversations = @current_user.converstaions
  end

  def show; end

  private

  def set_conversation
    @conversation = @current_user.converstations.find(params[:id])
  end
end