require 'rails_helper'

RSpec.feature 'User visiting site', type: :feature do
  xscenario 'When user visits the main page' do
    visit '/'

    expect(page).to have_text("Welcome to Smiling Wasabi!")
    expect(page.all('.genre-tag').empty?).to be(false)
    expect(page.all('.genre-tag .movie').empty?).to be(false)
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