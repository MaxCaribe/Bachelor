class Conversation::ConnectUsersService < ApplicationService
  def initialize(current_user, user)
    @current_user, @user = current_user, user
  end

  def perform
    if Conversation.already_created?(@current_user, @user)
      Error(I18n.t('conversation.connect.error'))
    else
      Success(connect_users)
    end
  end

  private

  def connect_users
    conversation = @current_user.conversations.create
    @user.conversations.build conversation
    conversation
  end
end