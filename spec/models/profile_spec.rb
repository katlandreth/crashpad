require 'rails_helper'

profile = FactoryGirl.build(:profile)

RSpec.describe Profile, type: :model do

  describe "ActiveModel validations" do
    it { expect(profile).to validate_presence_of(:first_name) }
    it { expect(profile).to validate_presence_of(:last_name) }
    it { expect(profile).to validate_inclusion_of(:smoker).in_array([true, false]) }
    it { expect(profile).to validate_inclusion_of(:pet_owner).in_array([true, false]) }
  end
end
