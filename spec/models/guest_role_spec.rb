require 'rails_helper'

guest = FactoryGirl.build(:guest_role)

RSpec.describe GuestRole, type: :model do
  describe "ActiveModel associations" do
    it { expect(guest).to belong_to(:member) }
    it { expect(guest).to have_db_column(:smoking_preference).of_type(:string).with_options(default:"no preference") }
    it { expect(guest).to have_db_column(:pet_preference).of_type(:string).with_options(default:"no preference") }
  end
end
