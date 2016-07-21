class DashboardController < ApplicationController
  respond_to :json, :js, :html

  def new
    @dashboard = Dashboard.new(current_member, Role.new(current_member.host_role || nil, current_member.guest_role || nil), current_member.profile, view_context)
  end

  def create
    @dashboard = Dashboard.new(current_member, Role.new(current_member.host_role || nil, current_member.guest_role || nil), current_member.profile, view_context)
  end

end
