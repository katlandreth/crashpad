require 'rails_helper'
require 'database_cleaner'

feature "a Host " do
  let(:member) do
    profile = FactoryGirl.create(:profile)
    host_role = FactoryGirl.create(:host_role)
    FactoryGirl.create(:member, profile: profile, host_role: host_role)
  end

  let(:location) { location = FactoryGirl.create(:location) }

  def fill_in_signin_fields
    fill_in "member[email]", with: member.email
    fill_in "member[password]", with: member.password
  end

  def fill_in_new_location_fields
    fill_in "location[name]", with: location.name
    fill_in "location[location_street]", with: location.location_street
    fill_in "location[location_city]", with: location.location_city
    fill_in "location[location_zip]", with: location.location_zip
    fill_in "location[max_occupants]", with: "2"

  end

  scenario "creates a new Location successfully", :js => true do
    visit root_path
    expect(page).to have_content("Welcome to crashpad")

    find("#lrg-screen-signin").click
    fill_in_signin_fields
    click_button "Sign in"
    expect(page).to have_content("Membership Info")

    # click_link 'Manage Locations'
    find('#dropdown-menu-1').click
    find('a#manage-locations-navlink').click
    expect(page).to have_content("Your Locations")

    find('.new-location-button a').click
    fill_in_new_location_fields
    attach_file "location_location_images_attributes_0_image", [Rails.root + 'spec/fixtures/thebean.jpg', Rails.root + 'spec/fixtures/test-upload.jpg']

    click_button "Create Location"

    expect(page).to have_content("Location Saved!")
  end

end
