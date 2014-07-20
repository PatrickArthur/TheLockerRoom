include Warden::Test::Helpers
Warden.test_mode!

require 'rails_helper'

feature 'guest sigout' do

  scenario 'user signs out' do

    user = FactoryGirl.build(:user)
    login_as(user)

    visit profiles_path

    click_on 'Sign out'


    expect(page).to have_content('You need to sign in or sign up before continuing')

  end

end
