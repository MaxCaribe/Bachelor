class Api::V1::Account::SessionsController < Api::V1::Account::BaseController
  def create
    result = Session.AuthService.new(credential_params).perform
    result.success? ? set_token(result.data) : render_unauthorized(result.error)
  end

  def destroy
    @current_session.destroy
  end

  private

  def credential_params
    params.permit(:email, :password)
  end
end