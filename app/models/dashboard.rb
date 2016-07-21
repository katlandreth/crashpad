class Dashboard
  attr_accessor :member, :role, :profile

  def initialize(member, role = nil, profile = nil, view_context = nil)
    @member = member
    @role = role
    @profile = profile
    @view = view_context
  end

  def profile_options
    if @profile != nil
      @decorated_profile = ProfileDecorator.new(@profile)
      @view.render partial: 'dashboard/profile_card', locals: { profile: @profile, decorated_profile: @decorated_profile }
    else
      @view.render partial: 'profiles/new', locals: { member: @member }
    end

  end

  def member_options
    if @profile != nil
      @decorated_profile = ProfileDecorator.new(@profile)
      @view.render partial: 'dashboard/member_card', locals: { profile: @profile, member: @member }
    else
      @view.render partial: 'profiles/new', locals: { member: @member }
    end
  end

  def role_options
    if @profile != nil
      @decorated_profile = ProfileDecorator.new(@profile)
      @view.render partial: 'dashboard/role_card', locals: { profile: @profile, role: @role }
    else
      @view.render partial: 'profiles/new', locals: { member: @member }
    end
  end

end
