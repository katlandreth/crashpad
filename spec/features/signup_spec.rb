require 'rails_helper'

feature "signing in" do
  let(:member) {FactoryGirl.create(:member)}

  def fill_in_signup_fields
    click_link "Sign up"
    fill_in "member[email]", with: "example@email.com"
    fill_in "member[password]", with: "12345678"
    fill_in "member[password_confirmation]", with: "12345678"
    click_button "Sign up"
  end

  scenario "visiting the site to sign in" do
    visit root_path
    fill_in_signup_fields
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

end
