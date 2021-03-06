require 'rails_helper'

member = FactoryGirl.build(:member)

RSpec.describe Member, type: :model do

  describe "ActiveModel validations" do
    it { expect(member).to validate_uniqueness_of(:email).case_insensitive.with_message(member.email + " has already been taken") }
    it { expect(member).to allow_value("examplexyz@email.com").for(:email) }
    it { expect(member).to_not allow_value("base@example").for(:email) }
    it { expect(member).to validate_length_of(:password).is_at_least(8) }
    it { expect(member).to validate_confirmation_of(:password) }
  end

  describe "ActiveRecord associations" do
    it { expect(member).to have_one(:guest_role) }
    it { expect(member).to have_one(:host_role) }
    it { expect(member).to have_one(:profile) }
  end

end
