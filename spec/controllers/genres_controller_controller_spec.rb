require 'rails_helper'

RSpec.describe GenresController, type: :controller do

  describe "GET #index" do
    xit 'assigns all genres as @genre' do
      get :index
      expect(assigns(:genres)).to eq(Genre.all)
    end

    xit 'renders the genres#index page' do
      get :index
      expect(response).to render(:index)
    end
  end
end
