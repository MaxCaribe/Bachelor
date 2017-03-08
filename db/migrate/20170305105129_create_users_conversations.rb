class CreateUsersConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :users_conversations do |t|
      t.belongs_to :user
      t.belongs_to :conversation
    end
  end
end
