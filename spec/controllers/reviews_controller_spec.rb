require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  
  describe "GET reviews#index" do
    pending 'displays all reviews for a film' do
      get 'films/:id/reviews' 
      expect(assigns(:reviews)).to eq(assigns(:film).reviews)
    end
  end

  describe "reviews#show" do
  	pending '   '
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
