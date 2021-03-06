class User < ActiveRecord::Base
  has_many :reviews
  has_many :votes, foreign_key: :voter_id
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
end
