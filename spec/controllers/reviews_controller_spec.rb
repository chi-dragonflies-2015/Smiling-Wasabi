require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  let(:review) { FactoryGirl.build(:review) }
  
  describe "GET reviews#index" do
    xit "assigns @reviews" do

      get :index
      expect(assigns(:reviews)).to include([])

    pending 'displays all reviews for a film' do
      get 'films/:film_id/reviews' 
      expect(assigns(:reviews)).to eq(assigns(:film).reviews)
    end
  end

  describe "reviews#show" do
  	pending ' w'
  end

  describe  "reviews#new" do
  	pending '   '
  end

  describe "reviews#create" do
  	pending '   '
  end

  describe "reviews#destroy" do
  	pending '   '
  end


end
