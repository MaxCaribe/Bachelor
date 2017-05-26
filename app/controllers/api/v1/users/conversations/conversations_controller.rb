class Api::V1::Users::ConversationsController < Api::V1::BaseController
  before_action :set_user

  def create
    result = Conversation::ConnectUsersService.perform(@current_user, @user)
    result.success? ? render_success(result.data) : render_bad_request(result.error)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end