class Dashboard
  attr_accessor :member, :role, :profile

  def initialize(member, role = nil, profile = nil)
    @member = member
    @role = role
    @profile = profile
  end

end
