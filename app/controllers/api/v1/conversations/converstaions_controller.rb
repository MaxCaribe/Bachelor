class Api::V1::ConverstaionsController < Api::V1::Conversations::BaseController
  def index
    @conversations = @current_user.converstaions
  end

  def show
    #TODO
  end
end