class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true
  validates :email, presence: true
  validates :email, length: { minimum: 6 }
  validates :password, presence: true
end
