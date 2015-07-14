class Review < ActiveRecord::Base
  belongs_to :film
  belongs_to :user

  validates :content, presence: true
  validates :rating, presence: true
  validates_associated :film, :user

end