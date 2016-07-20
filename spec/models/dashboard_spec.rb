require 'rails_helper'

host = FactoryGirl.build(:host_role)
guest = FactoryGirl.build(:guest_role)
role = Role.new(host, guest)

member = FactoryGirl.build(:member)
profile = FactoryGirl.build(:profile)


RSpec.describe Role do

  it 'returns the Member object' do
    dashboard = Dashboard.new(member, role, profile)
    object = dashboard.member
    expect(object).to eq member
  end

  it 'returns the Role object' do
    dashboard = Dashboard.new(member, role, profile)
    object = dashboard.role
    expect(object).to eq role
  end
  
  # it 'returns the Profile object' do
  #   dashboard = Dashboard.new(member, role, profile)
  #   object = dashboard.profile
  #   expect(object).to eq profile
  # end

end
