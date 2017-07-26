class Api::V1::Account::SessionsController < Api::V1::Account::BaseController
  def create
    result = Session::AuthService.new(credential_params).perform
    if result.success?
      set_token(result.data)
      render 'api/v1/users/show'
    else
      render_unauthorized(result.error)
    end
  end

  def destroy
    @current_session.destroy
  end

  private

  def credential_params
    params.require(:user).permit(:email, :password)
  end
end