# require 'rails_helper'
#
# host = FactoryGirl.build(:host)
#
# RSpec.describe Member, type: :model do
#
#   describe "ActiveModel validations" do
#     it { expect(member).to validate_presence_of(:email).case_insensitive }
#     it { expect(member).to allow_value("example@email.com").for(:email) }
#     it { expect(member).to_not allow_value("base@example").for(:email) }
#     it { expect(member).to validate_length_of(:password).is_at_least(8) }
#   end
# end
