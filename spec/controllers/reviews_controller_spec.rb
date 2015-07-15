require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  before(:all) do
    DatabaseCleaner.strategy = :transaction
  end

  before(:each) do
    DatabaseCleaner.start
    @film = FactoryGirl.create(:good_film)
  end

  after(:each) do
    DatabaseCleaner.clean
  end

  
  describe "GET #index" do
     
     it 'renders the index template' do
      get :index, { :film_id => @film.id }
      expect(response).to render_template('index')
    end

    it "assigns @reviews" do
      get :index, { :film_id => @film.id }
      expect(assigns(:reviews)).to eq(@film.reviews)
    end

  end

  describe "reviews#show" do
  	
    before do
      get :show, { :film_id => @film.id, :id => @film.reviews.first.id }
    end

    it "assigns the film as @film" do
      expect(assigns(:film)).to eq(@film)
    end

    it "assigns the review as @review" do
      expect(assigns(:review)).to eq(@film.reviews.first)
    end

  end

  describe  "reviews#new" do
  	
    before do
      get :new, { :film_id => @film.id }
    end

    it "assigns the film as @film" do
      expect(assigns(:film)).to eq(@film)
    end

    it "assigns the review as @review" do
      expect(assigns(:review)).to be_a Review
    end

  end

  describe "reviews#create" do
  	pending '   '
  end

  describe "reviews#destroy" do
  	pending '   '
  end

end
