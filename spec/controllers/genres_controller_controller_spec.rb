require 'rails_helper'

RSpec.describe GenresController, type: :controller do

  describe "GET #index" do
    it 'assigns all genres as @genre' do
      get :index
      expect(assigns(:genres)).to eq(Genre.all)
    end

    it 'renders the genres#index page' do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
