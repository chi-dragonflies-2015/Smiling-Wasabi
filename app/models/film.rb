class Film < ActiveRecord::Base
  has_many :films_genres
  has_many :genres, through: :films_genres
end