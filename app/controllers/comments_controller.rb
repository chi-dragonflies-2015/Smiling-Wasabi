 class CommentsController < ApplicationController


  def new
  	@film = Film.find(params[:film_id])

    if params[:review_id]
      @review = Review.find(params[:review_id])    
      @comment = @review.comments.new
      @url = "films/#{@film.id}/reviews/#{@review.id}/comments"
    else
      @comment = @film.comments.new
      @url = "films/#{@film.id}/comments"
    end
  end

  def create
    puts '----------------------------------------'
    @film = Film.find(params[:film_id]) 

    if params[:review_id]
      @review = Review.find(params[:review_id]) 
      @comment = @review.comments.new(comment_params)
      
      if @comment.save
        redirect_to @review, notice: 'Comment was successfully created.'
      end
    
    else
      @comment = @film.comments.new(comment_params)
      if @comment.save
        redirect_to @film, notice: 'Comment was successfully created.'
      end 
    end

    unless @comment.save
      puts '***************************************************'
      render :new
    end
  end


  #require authorization
  def edit
    @film = Film.find(params[:film_id]) 
    @comment = Comment.find(params[:id])
    
    if params[:review_id]
      @review = Review.find(params[:review_id]) 
      @url = "films/<%= @film.id %>/reviews/<%= @review.id %>/comments/<%= @comment.id =>"
    else
      @url = "films/<%= @film.id %>/comments/<%= @comment.id =>"
    end

  end

  #require authorization
  def update
  	@film = Film.find(params[:film_id])
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      if params[:review_id]
        @review = Review.find(params[:review_id])
        redirect_to @review, notice: 'Comment was successfully updated.'
      else
        redirect_to @film, notice: 'Comment was successfully updated.'
      end
    else
      render :edit
    end
  end

  #require authorization
  def destroy
  	@film = Film.find(params[:film_id])
    @comment = Comment.find(params[:id])

    @comment.destroy
    if params[:review_id]
      @review = Review.find(params[:review_id])
      redirect_to @review
    else
      redirect_to @film
    end
    
  end

  private
  
  def comment_params
    params.require(:comment).permit(:content, :rating, :checkbox_value)
  end

end