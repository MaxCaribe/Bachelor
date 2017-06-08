class Api::V1::Account::BaseController < ApplicationController
  skip_before_action :authenticate, only: [:create]

  private

  def set_token(session)
    @current_session = session
    headers['Authorization'] = @current_session.access_token
  end
end