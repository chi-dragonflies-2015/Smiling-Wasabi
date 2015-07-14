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
    it 'has content' do
      expect(@review.content).not_to be nil
    end

    it 'has a rating' do
      expect(@review.rating).not_to be nil
    end

    xit 'created by a trusted reviewer' do
      expect(@review.user.role).to eq("trusted")
    end
  end

  describe "validations" do
  xit "is valid when it's a review" do
    @review.valid?
    expect(@review.errors).to be_empty
    end
  end

end