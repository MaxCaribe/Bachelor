class Conversation < ApplicationRecord
  has_and_belongs_to_many :users, autosave: true, join_table: :users_conversations
  has_many :messages

  def self.already_created?(current_user, user)
    current_user.conversations.each do |conversation|
      return true if conversation.users.find_by(id: user.id)
    end
    false
  end
end