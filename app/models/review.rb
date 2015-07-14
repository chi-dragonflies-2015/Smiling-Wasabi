class Review < ActiveRecord::Base
  belongs_to :film
  belongs_to :user

  validates :content, presence: true
  validates :rating, inclusion: { in: [true,false] }

  validates_associated :film, :user

end