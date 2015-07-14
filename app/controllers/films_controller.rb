class FilmsController < ApplicationController

  def index
    @genre = Genre.all
  end
end