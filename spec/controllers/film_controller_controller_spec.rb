require 'rails_helper'

RSpec.describe FilmsController, type: :controller do

  describe "GET #index" do
    pending 'assigns all genres as @genre' do
      get :index
      expect(assigns(:genre)).to eq(Genre.all)
    end
  end
end
