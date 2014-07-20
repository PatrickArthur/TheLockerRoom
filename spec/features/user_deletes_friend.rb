require "rails_helper"

feature "user visits profile page to delete friendship" do

  user = FactoryGirl.build(:user)

  scenario "User visits profile" do
     profile = FactoryGirl.create(:profile)

    login_as(user)
    visit profile_path(profile.id)
    save_and_open_page

    click_link "Remove"

    expect(page).to have_content("Removed friendship.")
  end

end
