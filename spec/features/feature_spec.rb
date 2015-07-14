require 'rails_helper'

RSpec.feature 'User visiting site', type: :feature do
  scenario 'When user visits the main page' do
    visit '/'

    expect(page).to have_text("Welcome to Smiling Wasabi!")
    expect(page.all('.genre-tag').empty?).to be(false)
    expect(page.all('.genre-tag .movie').empty?).to be(false)
  end
end