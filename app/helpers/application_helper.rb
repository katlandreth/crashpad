module ApplicationHelper

  def flash_button(name)
    name = name.to_sym
    flash_type = {success: "✔", error: "⦻", alert: "⚠", notice: "i"}
    flash_type[name]
  end

  def display_member_nav
    if member_signed_in? && current_member.has_profile?
      render 'shared/member_nav'
    end
  end


end
