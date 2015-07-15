class FilmsController < ApplicationController
  def index
    @films = Film.all
  end

  def show
    @film = Film.find(params[:id])
    @reviews = @film.reviews
  end
end
