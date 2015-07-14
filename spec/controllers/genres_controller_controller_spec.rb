require 'rails_helper'

RSpec.describe GenresController, type: :controller do

  describe "GET #index" do
    pending 'assigns all genres as @genre' do
      get :index
      expect(assigns(:genre)).to eq(Genre.all)
      expect(response).to render(:index)
    end
  end
end
