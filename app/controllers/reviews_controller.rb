class ReviewsController < ApplicationController

  def index
  	@film = Film.find(params: :film_id)
  	@reviews = @film.reviews
  end

  def new
  	#create a new review
  	#shows form
  end

  def create
  end

  def show
  	#individual review
  end

  def edit
  	#edit review form
  	#only avaiable to creator
  end

  def update
  	#updates review
  end

  def destroy
  	#deletes review
  end

end