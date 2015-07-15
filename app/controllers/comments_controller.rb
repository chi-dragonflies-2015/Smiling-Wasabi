 class CommentsController < ApplicationController


  def new
  	@film = Film.find(params[:film_id])
    @comment = Comment.new(film: @film)
  end

  def create
    @film = Film.find(params[:film_id])
    @comment = @film.comments.build(comment_params)

    if @comment.save
      redirect_to @film, notice: 'Comment was successfully created.'
    else
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