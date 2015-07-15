 class CommentsController < ApplicationController


  def new
  	if params[:review_id]
      @review = Review.find(params[:review_id])
      @film = Film.find(params[:film_id]) 
      @comment = @review.comments.new
      @url = "films/<%= @film.id %>/reviews/<%= @review.id %>/comments"
    else
      @film = Film.find(params[:film_id])
      @comment = Comment.new(film: @film)
      @url = "films/<%= @film.id %>/comments"
    end
  end

  def create
    if params[:review_id]
      @review = Review.find(params[:review_id])
      @film = Film.find(params[:film_id]) 
      @comment = @review.comments.new(comment_params)
      if @comment.save
        redirect_to @review, notice: 'Comment was successfully created.'
      end
    
    else
      @film = Film.find(params[:film_id])
      @comment = @review.comments.new(comment_params)
      if @comment.save
        redirect_to @film, notice: 'Comment was successfully created.'
      end 
    end

    unless @comment.save
      render :new
    end
  end


  #require authorization
  def edit
  	@film = Film.find(params[:film_id])
    @comment = Comment.find(params[:id])
  end

  #require authorization
  def update
  	@film = Film.find(params[:film_id])
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to @comment, notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  #require authorization
  def destroy
  	@film = Film.find(params[:film_id])
    @comment = Comment.find(params[:id])

    @comment.destroy
    redirect_to @film
  end

  private
  
  def review_params
    params.require(:comment).permit(:content, :rating, :checkbox_value)
  end

end