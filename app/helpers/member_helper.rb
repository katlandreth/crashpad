module MemberHelper

  def signed_in?
    if member_signed_in?
      'signed-in'
    else
      'not-signed-in'
    end
  end

  def profile_options(member)
    if member.has_profile?
      render partial: 'profiles/edit', locals: { member: member }
    else
      render partial: 'profiles/new', locals: { member: member }
    end
  end

  def role_options(member)
    if member.has_both_roles?
      capture do
        concat render partial: 'profiles/edit', locals: { member: member }
        concat render partial: 'host_roles/edit', locals: { member: member }
      end
    elsif member.has_host_role?
      render partial: 'host_roles/edit', locals: { member: member }
    elsif member.has_guest_role?
      render partial: 'guest_roles/edit', locals: { member: member }

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
