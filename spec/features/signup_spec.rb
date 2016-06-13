require 'rails_helper'

feature "visiting website to sign up" do
  let(:member) {FactoryGirl.create(:member)}

  def fill_in_signup_fields
    fill_in "new-member-email", with: "example@email.com"
    fill_in "new-member-password", with: "12345678"
    fill_in "new-member-password-confirmation", with: "12345678"
  end

  def fill_in_profile_fields
    fill_in "profile[first_name]", with: "Eren"
    fill_in "profile[last_name]", with: "Jaeger"
    choose "non-smoker"
  end

  def fill_in_guest_role_fields
    fill_in "guest_role[smoking_preference]"
    fill_in "guest_role[pet_preference]"
  end


  scenario "a user signs up as a Guest successfully", :js => true do
    visit root_path
    expect(page).to have_content("Please sign in, or sign up to continue.")

    click_link "Sign up"
    expect(page).to have_content("First, let's create your login information.")

    fill_in_signup_fields
    click_button "Create"
    expect(page).to have_content("Will you be a host or a guest?")
    click_link "guest-only"

    # fill_in_guest_role_fields
    # click_button "Next step"
    # expect(page).to have_content("Now, tell us a little about yourself.")
    #
    # fill_in_profile_fields
    # click_button "Finish signup"
    # expect(page).to have_content("Thanks for signing up! You can edit your info or add a Host account to your membership by visiting your profile page.")
  end

end
