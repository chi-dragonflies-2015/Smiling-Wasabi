class FilmsController < ApplicationController
  def index
    @films = Film.all
  end

  def show
    @film = Film.find(params[:id])
    @comments = @film.comments

    @reviews = @film.reviews.page(params[:page]).per(5)

  end
end
