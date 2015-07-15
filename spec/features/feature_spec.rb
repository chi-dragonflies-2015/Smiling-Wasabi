require 'rails_helper'

RSpec.feature 'User visiting site', type: :feature do
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

  scenario 'When user visits the main page' do
    FactoryGirl.create(:genre_with_films)

    visit '/'
    expect(page).to have_text("Welcome to Smiling Wasabi!")
    expect(page.all('.genre-tag').empty?).to be(false)
    expect(page.all('.genre-tag .movie-short').empty?).to be(false)
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

  scenario 'with blank email' do
    visit signup_path
    sign_up_with(@user.name, "", @user.password)

    expect(page).to have_text("Email can't be blank")
  end

  xscenario 'with blank password' do
    visit signup_path
    sign_up_with(@user.name, @user.email, "")

    expect(page).to have_text("Password is too short (minimum is 6 characters)")
  end

end

 
RSpec.feature 'Individual Review Page', type: :feature do
  before(:all) do
    DatabaseCleaner.strategy = :transaction
  end

  before(:each) do
    DatabaseCleaner.start
    @film = FactoryGirl.create(:good_film)
    @review = @film.reviews.first
    @reviewer = @review.user
  end

  after(:each) do
    DatabaseCleaner.clean
  end

  scenario 'user can see full review on a review page' do
    visit film_review_path(@film, @review) 
    expect(page).to have_css '.full_review'
  end

  xscenario 'a trusted user can create a review'do
    visit new_film_review_path(@film) 
    # check auth
    fill_in 'review[content]', with: 'A thrill ride'
    check 'review[rating]'
    click_button 'Create'
    expect(page).to have_content('Review was successfully created.')
  end

end
