require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  before(:all) do
    DatabaseCleaner.strategy = :transaction
  end

  before(:each) do
    DatabaseCleaner.start
    @film = FactoryGirl.create(:film)
    @comment = @film.comments.build
  end

  after(:each) do
    DatabaseCleaner.clean
  end

  describe  "comments#new" do
  	
    before do
      get :new, { :film_id => @film.id }
    end
    
    xit "assigns the film as @film" do
      expect(assigns(:film)).to be_a Film
    end

    xit "assigns the comment as @comment" do
      expect(assigns(:comment)).to eq(@comment)
    end


  end

  describe "comments#create" do
  	context "when valid params are passed" do
      before do
        @original_count = @film.comments.count
        post :create, {:film_id => @film.id, :comment => {content: "A visual masterpiece", rating: true}} 
      end

      xit "creates a new Comment" do
        expect(@film.comments.count - @original_count).to eq(1)
      end

      xit "assigns a newly created comment as @comment" do
        expect(assigns(:comment)).to be_a Comment
      end

      xit "redirects to the film page" do
        expect(response).to redirect_to(assigns(:film))
      end
    
    end

    context "when invalid params are passed" do

      before do
        post :create, {:film_id => @film.id, :comment => {content: nil, rating: true}}
      end

      xit "assigns a newly created but unsaved comment as @comment" do
        expect(assigns(:comment).id).to eq(nil)
      end

      xit "re-renders the 'new' template" do
        expect(response).to render_template(:new)
      end

    end

  end


  describe "comments#edit" do
    before do
      get :edit, { :film_id => @film.id, :id => @comment.id }
    end

    xit "assigns a film as @film" do
      expect(assigns(:film)).to be_a Film
    end

    xit "assigns the appropriate film as @film" do
      expect(assigns(:film).id).to eq(@film.id)
    end

    xit "assigns a review as @review" do
      expect(assigns(:comment)).to be_a Comment
    end

    xit "assigns the appropriate review as @review" do
      expect(assigns(:comment).id).to eq(@comment.id)
    end

  end

  describe "comments#update" do
      context "when valid params are passed" do
      before do
        @original_count = @film.comments.count
        post :update, {:film_id => @film.id, :id => @comment.id, :comment => {content: "A visual masterpiece", rating: true}} 
      end

      xit "assigns a film as @film" do
        expect(assigns(:film)).to be_a Film
      end

      xit "assigns a newly updated comment as @comment" do
        expect(assigns(:comment)).to be_a Comment
      end
      
      xit "does not create a new Comment" do
        expect(@film.comments.count - @original_count).to eq(0)
      end

      xit "redirects to the film page" do
        expect(response.status).to eq(200)

      end
    
    end

    context "when invalid params are passed" do

      before do
        @original_comment = @film.comments.first
        post :update, {:film_id => @film.id,:id => @comment.id, :comment => {content: nil, rating: true}}
      end

      xit "does not change a comment" do
        expect(assigns(:comment)).to eq(@original_comment)
      end

      xit "re-renders the 'edit' template" do
        expect(response).to render_template(:edit)
      end

    end
  end

  describe "comments#destroy" do
  	before do
      @original_count = @film.comments.count
      @original = @film.comments.first
      delete :destroy, {:film_id => @film.id,:id => @comment.id}
    end

    xit "assigns the requested review as @review" do
      expect(assigns(:comment)).to eq(@original)
    end

    xit "destroys the requested game" do
      expect(@original_count - @film.comments.count).to eq(1)
    end

    xit "redirects to the film list" do
      expect(response).to redirect_to(@film)
    end

  end

end
