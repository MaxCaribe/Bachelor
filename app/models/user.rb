class User < ApplicationRecord
  has_and_belongs_to_many :games
  has_and_belongs_to_many :conversations, autosave: true, join_table: :users_conversations
  has_and_belongs_to_many :contacts,
                          class_name: 'User',
                          join_table: :contacts,
                          foreign_key: :user_id,
                          association_foreign_key: :contact_id
  has_many :messages
  has_one :session
  has_one :location

  alias_attribute :password_digest, :encrypted_password

  validates :password, length: { minimum: 8 }, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true

  has_secure_password
end