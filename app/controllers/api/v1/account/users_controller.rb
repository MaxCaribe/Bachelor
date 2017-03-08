class Api::V1::Account::UsersController < Api::V1::Account::BaseController
  #TODO
  def create
    User.create(sign_up_params)
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