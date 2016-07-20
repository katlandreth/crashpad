require 'rails_helper'

host = FactoryGirl.build(:host_role)
guest = FactoryGirl.build(:guest_role)


RSpec.describe Role do
  it 'returns host if the member has only a host role ' do
    role = Role.new(host)
    role_kind = role.kind
    expect(role_kind).to eq 'host'
  end

  it 'returns guest if the member has only a guest role ' do
    role = Role.new(nil, guest)
    role_kind = role.kind
    expect(role_kind).to eq 'guest'
  end
end
