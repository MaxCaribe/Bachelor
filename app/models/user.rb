class User < ApplicationRecord
  has_and_belongs_to_many :games
  has_and_belongs_to_many :conversations
  has_many :messages
  has_many :locations
  has_one :location

  validates :length, minimum: 8
  validates :confirmation, allow_blank: false

  has_secure_password
end