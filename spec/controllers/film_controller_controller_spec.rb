require 'rails_helper'

RSpec.describe FilmControllerController, type: :controller do

  describe "GET #index" do
    it 'assigns all genres as @genre' do
      get :index
      expect(assigns(:genre)).to eq(Genre.all)
    end
  end
end
