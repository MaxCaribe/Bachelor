class Api::V1::Account::UsersController < Api::V1::Account::BaseController
  def create
    if sign_up_params.blank?
      render_bad_request I18n.t('general.blank_params')
    else
      result = Session.RegistrationService.new(sign_up_params).perform
      result.success? ? set_token(result.data) : render_unprocessable_entity(result.error)
    end
  end

  def update
    @current_user.update(update_params)
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def sign_up_params
    user_params
  end

  def update_params
    user_params
  end
end