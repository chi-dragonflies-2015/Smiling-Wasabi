require 'coveralls'
Coveralls.wear!('rails')

  def sign_up_with(name, email, password)
    visit signup_path
    fill_in 'Name', with: name
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password Confirmation', with: password
    click_button 'Sign up'
  end
end
