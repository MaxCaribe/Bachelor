class Session::RegistrationService < ApplicationService
  def initialize(user_params)
    @user_params = user_params
  end

  def perform
    set_user
    @user.valid? ? @user.save : return Error(I18n.t('registration.error'))
    Success(get_session)
  end

  private

  def set_user
    @user = User.new(@user_params)
  end

  def get_session
    @user.sessions.create
  end
end