require 'rails_helper'

RSpec.describe Film, type: :model do
  before(:all) do
    DatabaseCleaner.strategy = :transaction
  end

  before(:each) do
    DatabaseCleaner.start
    @film = FactoryGirl.create(:film)
  end

  after(:each) do
    DatabaseCleaner.clean
  end


  it 'has a title' do
    expect(@film.title).to eq("Zoolander")
  end

  it 'has a description' do
    expect(@film.description).to eq("A funny film starring Ben Stiller as a male model.")
  end

  it 'has a link to movie art' do
    expect(@film.movie_art).to eq('http://resizing.flixster.com/qLJGPymgNIMnjMyV5RAOyJp8pcI=/180x270/dkpu1ddg7pbsk.cloudfront.net/movie/11/16/89/11168983_ori.jpg')
  end

  describe '#review_score' do
    it 'should return the film score based on reviews' do
      expect(FactoryGirl.create(:good_film).review_score).to eq(100)
      expect(FactoryGirl.create(:bad_film).review_score).to eq(0)
    end
  end

  describe '#user_score' do
    it 'should return the film score based on user votes' do
      expect(FactoryGirl.create(:popular_film).user_score).to eq(100)
      expect(FactoryGirl.create(:unpopular_film).user_score).to eq(0)
    end
  end
end
