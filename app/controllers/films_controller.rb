class FilmsController < ApplicationController
  def index
    @films = Film.top_movies
  end

  def show
    @film = Film.movie_title()
  end
end
