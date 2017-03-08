class Api::V1::Account::SessionsController < Api::V1::Account::BaseController
  def create
    Session.AuthService.new(credential_params).perform
  end

  def destroy
    @current_session.destroy
  end

  private

  def credential_params
    params.permit(:email, :password)
  end
end