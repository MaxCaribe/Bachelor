class Api::V1::ContactsController < Api::V1::BaseController
  before_action :set_user

  def create
    @current_user.contacts << @user
  end

  def destroy
    @current_user.contacts.delete(@user)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end