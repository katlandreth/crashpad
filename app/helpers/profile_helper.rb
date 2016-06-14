module ProfileHelper

  def host_or_guest(profile)
    member = Member.find(profile.member_id)
    unless member.host_role.nil?
      return "Guest"
    else
      return "Host"
    end
  end
end
