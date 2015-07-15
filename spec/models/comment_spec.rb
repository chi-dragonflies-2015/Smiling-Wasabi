require 'rails_helper'

RSpec.describe Film, type: :model do
  
  before(:all) do
    DatabaseCleaner.strategy = :transaction
  end

  before(:each) do
    DatabaseCleaner.start
    @comment = FactoryGirl.create(:comment)
  end

  after(:each) do
    DatabaseCleaner.clean
  end

  describe 'Comment' do
    it 'has content' do
      expect(@comment.content).not_to be nil
    end
  end

    it 'has a rating' do
      expect(@comment.rating).not_to be nil
    end

  describe "validations" do
    it "is valid when it's a comment" do
      @comment.valid?
      expect(@comment.errors).to be_empty
    end
  end

end