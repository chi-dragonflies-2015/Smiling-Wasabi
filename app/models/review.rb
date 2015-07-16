class Review < ActiveRecord::Base
  belongs_to :film
  belongs_to :user
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable

  validates :content, presence: true
  validates :rating, inclusion: { in: [true,false] }

  validates_associated :film, :user

  def user_score
    all_votes = votes
    return 0 if all_votes.length == 0
    upvotes = all_votes.select{ |vote| vote.value == true }
    100 * upvotes.length / all_votes.length
  end
end