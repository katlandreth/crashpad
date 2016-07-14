require 'rails_helper'
require 'database_cleaner'

feature "visiting the website to sign in" do
  let(:member) do
    profile = FactoryGirl.create(:profile)
    FactoryGirl.create(:member, profile: profile)
  end

  def fill_in_signin_fields
    fill_in "member[email]", with: member.email
    fill_in "member[password]", with: member.password
    click_button "Sign in"
  end

  scenario "an existing user signs in successfully" do
    visit root_path
    expect(page).to have_content("Welcome to crashpad")

    click_link "Sign in here"
    fill_in_signin_fields
    expect(page).to have_content("Signed in successfully.")
  end

end
