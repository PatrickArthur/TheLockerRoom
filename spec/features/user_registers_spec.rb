
require 'rails_helper'

feature 'guest registers' do

  scenario 'fill out registration form' do

    visit new_user_registration_path

    fill_in 'Email', with: 'bob@example.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'

    click_button 'Sign up'

    expect(page).to have_content('You have signed up successfully.')
  end

end
