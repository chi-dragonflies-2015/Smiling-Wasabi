class ReviewsController < ApplicationController

  def index
  	@film = Film.find(params: :film_id)
  	@reviews = @film.reviews
  end

  def new
  	@film = Film.find(params: :film_id)
    @review = Review.new(film: @film)
  end

  def create
    @film = Film.find(params: :film_id)
    @review = Review.new(review_params)

    if @review.save
      redirect_to @film, notice: 'Review was successfully created.'
    else
      render :new
    end
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

  private
  
  def review_params
    params.require(:review).permit(:content, :rating, :checkbox_value)
  end

end