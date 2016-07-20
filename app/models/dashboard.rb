class Dashboard
  attr_accessor :member, :role, :profile

  def initialize(member, role, profile)
    @member = member
    @role = role
    @profile = profile
  end

end
