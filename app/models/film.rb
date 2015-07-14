class Film < ActiveRecord::Base
  has_many :films_genres
  has_many :genres, through: :films_genres
  has_many :reviews
  has_many :votes, as: :voteable


  def review_score
    all_reviews = reviews
    return 'N/A' if all_reviews.length == 0
    good_reviews = all_reviews.select{ |review| review.rating == true }
    100 * good_reviews.length / all_reviews.length
  end
end