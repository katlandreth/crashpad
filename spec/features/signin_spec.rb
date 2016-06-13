require 'rails_helper'

feature "visiting the website to sign in" do
  let(:member) {FactoryGirl.create(:member)}

  def fill_in_signin_fields
    fill_in "member[email]", with: member.email
    fill_in "member[password]", with: member.password
    click_button "Sign in"
  end

  scenario "an existing user signs in successfully" do
    visit root_path
    expect(page).to have_content("Please sign in, or sign up to continue.")
    fill_in_signin_fields
    expect(page).to have_content("Signed in successfully.")
  end

end
