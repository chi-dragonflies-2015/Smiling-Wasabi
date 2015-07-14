require 'rails_helper'

RSpec.feature 'User visiting site', type: :feature do
  xscenario 'When user visits the main page' do
    visit '/'

    expect(page).to have_text("Welcome to Smiling Wasabi!")
    expect(page.all('.genre-tag').empty?).to be(false)
    expect(page.all('.genre-tag .movie').empty?).to be(false)
  end

  scenario 'When user clicks the Signup link' do
    visit '/'
    click_link 'signup_link'

    expect(current_path).to eq(signup_path)
  end
end

RSpec.feature 'User Signs up', type: :feature do
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

  scenario 'with valid email and password' do
    visit signup_path
    sign_up_with(@user.name, @user.email, @user.password)

    expect(current_path).to eq(root_path)
  end

  xscenario 'with invalid email' do
    visit signup_path
    sign_up_with(name, email, password)

  end

  xscenario 'with blank password' do
    visit signup_path
    sign_up_with(name, email, password)

    # write expect stuff
  end

  xscenario 'the user sees reviews on an individual film' do
    visit 'films/1'

    expect(page).to have_css '.review'
  end

  xscenario 'a trusted user can create a review'do
    visit 'films/1/reviews/new'
    check auth
    fill_in 'content', with: review.content
    click_button 'Submit Review'
    expect(page).to have_css '.review'
  end

end
