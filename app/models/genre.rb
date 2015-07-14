class Genre < ActiveRecord::Base
  has_many :films_genres
  has_many :films, through: :films_genres

  # def top5films
  #   films.all.order("")
  # end
end