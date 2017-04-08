class Api::V1::BaseController < ApplicationController
  protect_from_forgery with: :null_session

  rescue_from ActiveRecord::RecordNotFound, with: :render_rescued_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_rescued_unprocessable_entity
  rescue_from ActionController::ParameterMissing, with: :render_rescued_unprocessable_entity

  def render_error(status, type, message)
    json_error = { type: type, message: message }
    render json: json_error, status: status
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

  def render_rescued_unprocessable_entity(error)
    render_error(422, I18n.t('error.unprocessable_entity'), error.message)
  end

  def render_unprocessable_entity(message)
    render_error(422, I18n.t('error.unprocessable_entity'), message)
  end
end