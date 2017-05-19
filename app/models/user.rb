class User < ApplicationRecord
  has_and_belongs_to_many :games
  has_and_belongs_to_many :conversations
  has_and_belongs_to_many :contacts,
                          class_name: 'User',
                          join_table: :contacts,
                          foreign_key: :user_id,
                          association_foreign_key: :contact_id
  has_many :messages
  has_one :session
  has_one :location

  validates :password, length: { minimum: 8 }
  validates :password, confirmation: true, allow_blank: false

  has_secure_password
end