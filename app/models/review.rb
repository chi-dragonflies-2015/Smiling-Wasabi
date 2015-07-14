class Review < ActiveRecord::Base
  belongs_to :film
  belongs_to :user
  has_many :votes, as: :voteable

  validates :content, presence: true
  validates :rating, inclusion: { in: [true,false] }
  validates_associated :film, :user

end