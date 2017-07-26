class Api::V1::Account::BaseController < Api::V1::BaseController
  skip_before_action :authenticate, only: [:create]

  protected

  def set_token(session)
    @current_session = session
    @current_user = @current_session.user
    headers['Authorization'] = @current_session.access_token
  end
end