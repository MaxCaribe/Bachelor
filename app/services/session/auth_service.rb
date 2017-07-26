class Session::AuthService < Session::BaseService
  def initialize(credentials)
    @credentials = credentials
  end

  def perform
    if set_user && correct_password?
      Response::Success.new(get_session)
    else
      Response::Error.new(I18n.t('auth.error'))
    end
  end

  private

  def set_user
    @user = User.find_by(email: @credentials[:email])
  end

  def correct_password?
    @user.authenticate(@credentials[:password])
  end
end