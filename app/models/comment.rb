class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  validates :content, presence: true
  validates :rating, inclusion: { in: [true,false] }
end