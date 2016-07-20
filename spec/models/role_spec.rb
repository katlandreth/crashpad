require 'rails_helper'

member = FactoryGirl.build(:member)
host = FactoryGirl.build(:host_role)
guest = FactoryGirl.build(:guest_role)


RSpec.describe Role do
  it 'returns host if the member has only a host role ' do
    role = Role.new(member, host)
    role_kind = role.kind
    expect(role_kind).to eq 'host'
  end
end
