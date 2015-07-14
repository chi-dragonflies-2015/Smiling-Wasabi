require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  
  describe "GET #index" do
    pending 'assigns all genres as @genre' do
      get :index
      expect(assigns(:reviews)).to eq(film.reviews.all)
    end
  end


end
