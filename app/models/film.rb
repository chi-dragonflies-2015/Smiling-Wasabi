class Film < ActiveRecord::Base
  has_many :films_genres
  has_many :genres, through: :films_genres
  has_many :reviews
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable


  def review_score
    all_reviews = reviews
    return 0 if all_reviews.length == 0
    good_reviews = all_reviews.select{ |review| review.rating == true }
    100 * good_reviews.length / all_reviews.length
  end

  def self.top_movies
    results = Imdb::Top250.new.movies
    results.select do |movie|
      movie.title != ""
    end
  end

  def self.movie_title(title)
    results = Imdb::Search.new(title)
    results.movies.each do |movie|
      movie.title
    end
  end

  def self.movie_plot(title)
    results = Imdb::Search.new(title)
    results.movies.each do |movie|
      movie.plot
    end
  end

  def user_score
    all_votes = votes
    return 0 if all_votes.length == 0
    upvotes = all_votes.select{ |vote| vote.value == true }
    100 * upvotes.length / all_votes.length
  end
end