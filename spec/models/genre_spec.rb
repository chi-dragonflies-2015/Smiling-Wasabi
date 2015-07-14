require 'rails_helper'

RSpec.describe Genre, type: :model do

  before(:all) do
    DatabaseCleaner.strategy = :transaction
  end

  before(:each) do
    DatabaseCleaner.start
    @genre = FactoryGirl.create(:genre)
  end

  after(:each) do
    DatabaseCleaner.clean
  end

  it 'has a name' do
    expect(@genre.name).to eq('Superhero')
  end

  describe '#top5film' do
    before(:each) { @genre_with_films = FactoryGirl.create(:genre_with_films)}
    
    it 'returns an array' do
      expect(@genre_with_films.top5films).to be_an(Array)
    end

    it 'returns 5 films' do
      expect(@genre_with_films.top5films.length).to be(5)
    end
  end
end
