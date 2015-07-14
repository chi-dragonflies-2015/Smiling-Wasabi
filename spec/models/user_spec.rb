require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    DatabaseCleaner.strategy = :transaction
  end

  before(:each) do
    DatabaseCleaner.start
    @user = FactoryGirl.build(:user)
  end

  after(:each) do
    DatabaseCleaner.clean
  end

  it 'has a name' do
    expect(@user.name).to eq("traderjoe")
  end

  it 'has an email' do
    expect(@user.email).to eq("tj@test.com")
  end

  it 'has a password' do
    expect(@user.password).not_to eq(nil)
  end
end