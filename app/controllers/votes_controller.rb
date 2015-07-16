class VotesController < ApplicationController

  def vote
    if current_user.nil?
      puts "************************"
      render :json => { :status => 403 }
    else
      voted_object = Review.find(params[:review_id]) if params[:review_id]
      voted_object = Film.find(params[:film_id]) if params[:film_id]
      vote = voted_object.votes.find_by(voter_id: current_user.id)

      if vote && vote.value.to_s == params[:vote].to_s
        vote.destroy
      elsif vote
        vote.destroy
        voted_object.votes.create(voter: current_user, value: params[:vote])
      else
        voted_object.votes.create(voter: current_user, value: params[:vote])
      end

      if request.xhr?
        render :json => { status: :ok, score: voted_object.user_score.to_json, num_votes: voted_object.votes.length }
      else
        redirect_to :back
      end
    end
  end
end