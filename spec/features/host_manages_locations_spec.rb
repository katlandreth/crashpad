require 'rails_helper'
require 'database_cleaner'

feature "a Host " do
  let(:member) do
    profile = FactoryGirl.create(:profile)
    host_role = FactoryGirl.create(:host_role)
    FactoryGirl.create(:member, profile: profile, host_role: host_role)
  end

  def fill_in_signin_fields
    fill_in "member[email]", with: member.email
    fill_in "member[password]", with: member.password
  end

  def fill_in_new_location_fields
    fill_in "location[name]", with: member.email
    fill_in "location[location_street]", with: member.password
    fill_in "location[location_city]", with: member.password
    fill_in "location[location_zip]", with: member.password
    fill_in "location[max_occupants]", with: member.password
  end

  scenario "creates a new Location successfully", :js => true do
    visit root_path
    expect(page).to have_content("Welcome to crashpad")

    click_link "Sign in here"
    fill_in_signin_fields
    click_button "Sign in"
    expect(page).to have_content("Membership Info")

    # click_link 'Manage Locations'
    find('#dropdown-menu-1').click
    find('a#manage-locations-navlink').click
    expect(page).to have_content("Your Locations")

    find('.new-location-button a').click
    fill_in_new_location_fields
    click_button "Create Location"
    expect(page).to have_content("Your Location was Created!")

    click_link "Add Location Images"
    attach_file "upload-location-images", [Rails.root + 'spec/fixtures/test-upload.jpg', Rails.root + 'spec/fixtures/test-upload-2.jpg' ]
    expect(page).to have_css("img[src*='data:image/jpeg;base64']") #upload_preview.js makes a base 64 img preview before upload

    click_button "Upload Images"
    expect(page).to have_content("Your Location Was Updated.")
  end

end
