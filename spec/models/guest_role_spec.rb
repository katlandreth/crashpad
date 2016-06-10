require 'rails_helper'

guest = FactoryGirl.build(:guest)

RSpec.describe Guest, type: :model do
  describe "ActiveModel associations" do
    it { expect(host).to belong_to(:member) }
    it { expect(host).to have_db_column(:smoking_preference).of_type(:string).with_options(default:"no preference", null: false) }
    it { expect(host).to have_db_column(:pet_preference).of_type(:string).with_options(default:"no preference", null: false) }
    #turn these on when I'm ready to start making these models
    # it { expect(host).to have_one(:amenity_preference_list) }
    # it { expect(host).to have_one(:rule_preference_list) }
  end
end
