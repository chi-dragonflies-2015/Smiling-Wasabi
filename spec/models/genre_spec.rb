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
    
  end
end
