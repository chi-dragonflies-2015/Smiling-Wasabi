require 'rails_helper'

RSpec.describe Film, type: :model do
  before(:all) do
    DatabaseCleaner.strategy = :transaction
  end

  before(:each) do
    DatabaseCleaner.start
  end

  after(:each) do
    DatabaseCleaner.clean
  end

  describe 'title' do
    it 'is readable' do
      expect(film.title).not_to be(nil)
    end
  end
end
