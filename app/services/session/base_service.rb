class Session::BaseService < ApplicationService
  protected

  def get_session
    @user.sessions.create
  end
end