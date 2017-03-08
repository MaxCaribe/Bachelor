class Session::AuthService < ApplicationService
  def initialize(credentials)
    @credentials = credentials
  end

  def perform
    get_token if set_user && correct_password?
  end

  private

  def set_user
    @user = User.find_by(email: @credentials.email)
  end

  def correct_password?
    @user.authenticate(@credentials.password)
  end

  def get_token
    @user.sessions.create
  end
end