class Api::V1::BaseController < ApplicationController
  protect_from_forgery with: :null_session

  before_action :authenticate

  rescue_from ActiveRecord::RecordNotFound, with: :render_rescued_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_rescued_unprocessable_entity
  rescue_from ActionController::ParameterMissing, with: :render_rescued_unprocessable_entity

  def render_error(status, type, message)
    json_error = { type: type, message: message }
    render json: json_error, status: status
  end

  def render_success(message)
    render json: { success: message }, status: 200
  end

  def render_rescued_not_found(error)
    render_error(404, I18n.t('error.not_found'), error.message)
  end

  def render_not_found(message)
    render_error(404, I18n.t('error.not_found'), message)
  end

  def render_unauthorized(message)
    render_error(401, I18n.t('error.unauthorized'), message)
  end

  def render_bad_request(message)
    render_error(401, I18n.t('error.bad_request'), message)
  end

  def render_rescued_unprocessable_entity(error)
    render_error(422, I18n.t('error.unprocessable_entity'), error.message)
  end

  def render_unprocessable_entity(message)
    render_error(422, I18n.t('error.unprocessable_entity'), message)
  end

  protected

  def authenticate
    if @user_session ||= Session.non_expired.find_by(access_token: request.headers['Authorization'])
      @user_session.touch
      @current_user ||= @user_session.user
    else
      render_unauthorized I18n.t('session.error')
    end
  end
end