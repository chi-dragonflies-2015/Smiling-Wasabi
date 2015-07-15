require 'rails_helper'

RSpec.describe VotesController, type: :controller do
  
  before(:all) do
    DatabaseCleaner.strategy = :transaction
  end

  before(:each) do
    DatabaseCleaner.start
    request.env["HTTP_REFERER"] = "where_i_came_from"
    @film = FactoryGirl.create(:film)
    @review = FactoryGirl.create(:review)
    @user = FactoryGirl.create(:user)
  end

  after(:each) do
    DatabaseCleaner.clean
  end

  describe 'Voting' do
    describe 'if no vote exists for the user' do
      it 'a film vote is saved to the film' do
        put :vote, { vote: true, film_id: @film.id }, { user_id: @user.id }
        @film.reload
        expect(@film.user_score).to eq(100)
      end

      it 'a review vote is saved to the film' do
        put :vote, { vote: true, review_id: @review.id }, { user_id: @user.id }
        @review.reload
        expect(@review.user_score).to eq(100)
      end
    end

    describe 'if a vote exists for the user' do
      before(:each) do
        put :vote, { vote: true, film_id: @film.id }, { user_id: @user.id }
      end

      it 'a new vote removes the old vote' do
        expect do
          put :vote, { vote: true, film_id: @film.id }, { user_id: @user.id }
        end
        .to change{ Film.find(@film.id).votes.length }.from(1).to(0)
      end

      it 'a new vote of the opposite type replaces the old vote' do
        expect do
          put :vote, { vote: false, film_id: @film.id }, { user_id: @user.id }
        end
        .not_to change{ Film.find(@film.id).votes.length }
        
        @film.reload
        expect(@film.user_score).to eq(0)
      end
    end
  end
end
