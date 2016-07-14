require 'rails_helper'
require 'database_cleaner'

feature "visiting website to sign up," do
  let(:member) do
    profile = FactoryGirl.create(:profile)
    FactoryGirl.create(:member, profile: profile)
  end

  def fill_in_signup_fields
    fill_in "new-member-email", with: "example@email.com"
    fill_in "new-member-password", with: "12345678"
    fill_in "new-member-password-confirmation", with: "12345678"
  end

  def fill_in_profile_fields
    find('#myModal #profile_first_name').set('Eren')
    find('#myModal #profile_last_name').set('Jaeger')
    find('#myModal #profile_smoker').find('option[value="false"]').select_option
    find('#myModal #profile_pet_owner').find('option[value="false"]').select_option
  end

  def fill_in_guest_role_fields
    select 'no smoking allowed', from: 'guest_role_smoking_preference'
    select 'no pets allowed', from: 'guest_role_pet_preference'
  end

  def fill_in_host_role_fields
    select 'no smoking allowed', from: 'host_role_smoking_preference'
    select 'no pets allowed', from: 'host_role_pet_preference'
  end


  scenario "a user signs up as a Guest successfully", :js => true do
    visit root_path
    expect(page).to have_content("Welcome to crashpad")

    click_link "Sign up"
    expect(page).to have_content("First, let's create your login information.")

    fill_in_signup_fields
    click_button "Create"
    expect(page).to have_content("Will you be a host or a guest?")
    click_link "guest-only"

    fill_in_guest_role_fields
    click_button "Next step"
    expect(page).to have_content("Tell us a little about yourself.")

    fill_in_profile_fields
    find('#myModal .btn[type="submit"]').click
    expect(page).to have_content("Thanks for signing up! You can edit your info or add a Host account to your membership here on your profile page.")
  end


  scenario "a user signs up as a Host successfully", :js => true do
    visit root_path
    expect(page).to have_content("Welcome to crashpad")

    click_link "Sign up"
    expect(page).to have_content("First, let's create your login information.")

    fill_in_signup_fields
    click_button "Create"
    expect(page).to have_content("Will you be a host or a guest?")
    click_link "host-only"

    fill_in_host_role_fields
    click_button "Next step"
    expect(page).to have_content("Tell us a little about yourself.")

    fill_in_profile_fields
    find('#myModal .btn[type="submit"]').click
    expect(page).to have_content("Thanks for signing up! You can edit your info or add a Guest account to your membership here on your profile page.")
  end

  scenario "a user starts to sign up, but abandons the process before finishing member creation", :js => true do
    visit root_path
    expect(page).to have_content("Welcome to crashpad")

    click_link "Sign up"
    expect(page).to have_content("First, let's create your login information.")

    fill_in_signup_fields
    find('button.close').trigger("click")
    expect(page).to have_content("Your Crashpad Account Was Not Created.")
  end
  #
  # scenario "a user starts to sign up, but abandons the process after finishing member creation", :js => true do
  #   visit root_path
  #   expect(page).to have_content("Please sign in, or sign up to continue.")
  #
  #   click_link "Sign up"
  #   expect(page).to have_content("First, let's create your login information.")
  #
  #   fill_in_signup_fields
  #   click_button "Create"
  #   expect(page).to have_content("Will you be a host or a guest?")
  #
  #   find(button.close).click
  #   expect(page).to have_content("Your Crashpad account was created, but we still need some more information. You can log in and browse listings, but you won't be able to make a reservation as a guest, or create property listings as a host until you complete your profile.")
  # end

end
