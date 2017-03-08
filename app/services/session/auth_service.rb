class Session::AuthService < ApplicationService
  def initialize(credentials)
    @credentials = credentials
  end

  def perform
    return Error(I18n.t('auth.error')) unless set_user && correct_password?
    Success(get_session)
  end

  private

  def set_user
    @user = User.find_by(email: @credentials.email)
  end

  def correct_password?
    @user.authenticate(@credentials.password)
  end

  def get_session
    @user.sessions.create
  end
end