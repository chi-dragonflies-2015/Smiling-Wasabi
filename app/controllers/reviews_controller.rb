class ReviewsController < ApplicationController

  def index 
  	@film = Film.find(params[:film_id])
  	@reviews = @film.reviews
  end

  def new
  	@film = Film.find(params[:film_id])
    @review = Review.new(film: @film)
  end

  def create
    @film = Film.find(params[:film_id])
    @review = @film.reviews.build(review_params)

    if @review.save
      redirect_to @film, notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  def show
    @film = Film.find(params[:film_id])
    @review = Review.find(params[:id])
  end

  #require authorization
  def edit
  	@film = Film.find(params[:film_id])
    @review = Review.find(params[:id])
  end

  #require authorization
  def update
  	@film = Film.find(params[:film_id])
    @review = Review.find(params[:id])

    if @review.update(review_params)
      redirect_to @review, notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  #require authorization
  def destroy
  	@film = Film.find(params[:film_id])
    @review = Review.find(params[:id])

    @review.destroy
    redirect_to @film
  end

  private
  
  def review_params
    params.require(:review).permit(:content, :rating, :checkbox_value)
  end

end