class Session < ApplicationRecord
  belongs_to :user

  has_secure_token :access_token

  scope :non_expired, ->() { where('updated_at > ?', DateTime.now + EXPIRE_TIME ) }
end