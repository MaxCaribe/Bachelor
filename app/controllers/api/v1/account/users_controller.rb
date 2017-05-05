class Api::V1::Account::UsersController < Api::V1::Account::BaseController
  def create
    if user_params(sign_up_attributes).blank?
      render_bad_request I18n.t('general.blank_params')
    else
      result = Session.RegistrationService.new(user_params(sign_up_attributes)).perform
      result.success? ? set_token(result.data) : render_unprocessable_entity(result.error)
    end
  end

  def update
    @current_user.update(user_params(update_attributes))
    if game?
      #TODO
    end
  end

  private

  def user_params(permitted_attributes)
    params.require(:user).permit(permitted_attributes)
  end

  def sign_up_attributes
    [:email, :password, :password_confirmation].append(update_attributes).append(game_attributes)
  end

  def update_attributes
    [:first_name, :last_name, :year_of_birth]
  end

  def game_attributes
    [games: [:game_id]]
  end

  def game?
    params[:user][:games].present?
  end
end