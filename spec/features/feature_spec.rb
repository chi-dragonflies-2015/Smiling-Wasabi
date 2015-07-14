require 'rails_helper'
require 'spec_helper'

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


RSpec.feature 'User Signing', type: :feature do
  scenario 'with valid email and password' do
    visit signup_path
    sign_up_with(name, password)

    # write expect stuff
  end

  scenario 'with invalid email' do
    visit signup_path
    sign_up_with(name, password)

    # write expect stuff
  end

  scenario 'with blank password' do
    visit signup_path
    sign_up_with(name, password)

    # write expect stuff
  end
end