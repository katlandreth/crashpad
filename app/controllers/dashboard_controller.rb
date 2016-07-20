class DashboardController < ApplicationController
  respond_to :json, :js, :html

  def create
    @dashboard = Dashboard.new(current_member, current_member.role, current_member.profile)
  end
end
