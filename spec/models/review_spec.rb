require 'rails_helper'

RSpec.describe Film, type: :model do
  
  before(:all) do
    DatabaseCleaner.strategy = :transaction
  end

  before(:each) do
    DatabaseCleaner.start
    @review = FactoryGirl.create(:review)
  end

  after(:each) do
    DatabaseCleaner.clean
  end

  describe Review do
    it 'has content'
    it 'has a rating'
    it 'created by a trusted reviewer'
  end

end