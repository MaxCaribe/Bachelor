class Api::V1::Account::BaseController < ApplicationController
  private

  def set_token(session)
    @current_session = session
    headers['Authorization'] = @current_session.access_token
  end
end