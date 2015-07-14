class Genre < ActiveRecord::Base
  has_many :films_genres
  has_many :films, through: :films_genres

  def top5films
    sorted_films = films.sort{ |film1, film2| film1.review_score <=> film2.review_score }
    sorted_films.first(5)
  end
end