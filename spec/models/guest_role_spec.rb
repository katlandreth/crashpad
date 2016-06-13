require 'rails_helper'

guest = FactoryGirl.build(:guest_role)

RSpec.describe GuestRole, type: :model do
  describe "ActiveModel associations" do
    it { expect(guest).to belong_to(:member) }
    it { expect(guest).to have_db_column(:smoking_preference).of_type(:string).with_options(default:"no preference") }
    it { expect(guest).to have_db_column(:pet_preference).of_type(:string).with_options(default:"no preference") }
    #turn these on when I'm ready to start making these models
    # it { expect(host).to have_one(:amenity_preference_list) }
    # it { expect(host).to have_one(:rule_preference_list) }
  end
end
