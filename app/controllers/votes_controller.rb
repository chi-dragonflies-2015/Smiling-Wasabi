class VotesController < ApplicationController

  def vote
    voted_object = Review.find(params[:review_id]) if params[:review_id]
    voted_object = Film.find(params[:film_id]) if params[:film_id]
    vote = voted_object.votes.find_by(voter_id: current_user.id)
    if vote && vote.value == params[:vote]
      vote.destroy
    elsif vote
      vote.destroy
      voted_object.votes.create(voter: current_user, value: params[:vote])
    else
      voted_object.votes.create(voter: current_user, value: params[:vote])
    end

    voted_object.user_score
  end
end