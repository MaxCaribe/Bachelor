class Api::V1::ConversationsController < Api::V1::Conversations::BaseController
  def index
    @conversations = @current_user.converstaions
  end
end