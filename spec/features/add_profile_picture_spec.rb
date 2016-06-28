require 'rails_helper'
require 'database_cleaner'

feature "visiting their profile page," do
  let(:member) do
    profile = FactoryGirl.create(:profile)
    FactoryGirl.create(:member, profile: profile)
  end

  def fill_in_signin_fields
    fill_in "member[email]", with: member.email
    fill_in "member[password]", with: member.password
  end

  scenario "a user uploads a profile picture successfully", :js => true do
    visit root_path
    expect(page).to have_content("Please sign in, or sign up to continue.")

    fill_in_signin_fields
    click_button "Sign in"
    expect(page).to have_content("Your Membership info.")

    click_link "Profile Options"
    click_link "Add a Profile Picture"
    attach_file "upload-profile-picture", Rails.root + 'spec/fixtures/test-upload.jpg'
    expect(page).to have_css("img[src*='data:image/jpeg;base64']") #upload_preview.js makes a base 64 img preview before upload

    click_button "Upload Profile Picture"
    expect(page).to have_content("Your Profile Was Updated.")
  end

end
