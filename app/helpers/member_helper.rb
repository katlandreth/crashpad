module MemberHelper

  def signed_in?
    if member_signed_in?
      'signed-in'
    else
      'not-signed-in'
    end
  end

  def host_or_guest(member)
    unless member.host_role.nil?
      return "Guest"
    else
      return "Host"
    end
  end
end
