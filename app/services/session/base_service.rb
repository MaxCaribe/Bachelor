class Session::BaseService < ApplicationService
  protected

  def get_session
    @user.create_session
  end
end