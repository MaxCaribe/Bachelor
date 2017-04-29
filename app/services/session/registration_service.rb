class Session::RegistrationService < Session::BaseService
  def initialize(user_params)
    @user_params = user_params
  end

  def perform
    set_user
    if @user.valid?
      @user.save
    else
      return Error(I18n.t('registration.error'))
    end
    Success(get_session)
  end

  private

  def set_user
    @user = User.new(@user_params)
  end
end