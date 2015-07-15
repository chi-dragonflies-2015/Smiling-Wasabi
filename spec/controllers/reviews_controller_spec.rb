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
  	context "when valid params are passed" do
      before do
        @original_count = @film.reviews.count
        post :create, {:film_id => @film.id, :review => {content: "A visual masterpiece", rating: true}} 
      end

      it "creates a new Review" do
        expect(@film.reviews.count - @original_count).to eq(1)
      end

      it "assigns a newly created review as @review" do
        expect(assigns(:review)).to be_a Review
      end

      it "redirects to the film page" do
        expect(response).to redirect_to(assigns(:film))
      end
    
    end

    context "when invalid params are passed" do

      before do
        post :create, {:film_id => @film.id, :review => {content: nil, rating: true}}
      end

      it "assigns a newly created but unsaved review as @review" do
        expect(assigns(:review).id).to eq(nil)
      end

      it "re-renders the 'new' template" do
        expect(response).to render_template(:new)
      end

    end

  end


  describe "reviews#edit" do
    before do
      get :edit, { :film_id => @film.id, :id => @film.reviews.first.id }
    end

    it "assigns a film as @film" do
      expect(assigns(:film)).to be_a Film
    end

    it "assigns the appropriate film as @film" do
      expect(assigns(:film).id).to eq(@film.id)
    end

    it "assigns a review as @review" do
      expect(assigns(:review)).to be_a Review
    end

    it "assigns the appropriate review as @review" do
      expect(assigns(:review).id).to eq(@film.reviews.first.id)
    end

  end

  describe "reviews#update" do
      context "when valid params are passed" do
      before do
        @original_count = @film.reviews.count
        post :update, {:film_id => @film.id, :id => @film.reviews.first.id, :review => {content: "A visual masterpiece", rating: true}} 
      end

      it "assigns a film as @film" do
        expect(assigns(:film)).to be_a Film
      end

      it "assigns a newly updated review as @review" do
        expect(assigns(:review)).to be_a Review
      end
      
      it "does not create a new Review" do
        expect(@film.reviews.count - @original_count).to eq(0)
      end

      it "redirects to the review page" do
        expect(response.status).to eq(200)

      end
    
    end

    context "when invalid params are passed" do

      before do
        @original_review = @film.reviews.first
        post :update, {:film_id => @film.id,:id => @film.reviews.first.id, :review => {content: nil, rating: true}}
      end

      it "does not change a review" do
        expect(assigns(:review)).to eq(@original_review)
      end

      it "re-renders the 'edit' template" do
        expect(response).to render_template(:edit)
      end

    end
  end

  describe "reviews#destroy" do
  	pending '   '
  end

end
