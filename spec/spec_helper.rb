require 'coveralls'
Coveralls.wear!('rails')

  def sign_up_with(name, email, password)
    visit signup_path
    fill_in 'user_name', with: name
    fill_in 'user_email', with: email
    fill_in 'user_password', with: password
    fill_in 'user_password_confirmation', with: password
    click_button 'Sign Up'
  end




