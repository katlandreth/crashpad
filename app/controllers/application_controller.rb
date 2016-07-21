class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception

  alias_method :current_user, :current_member

  rescue_from Pundit::NotAuthorizedError, with: :member_not_authorized

  def after_sign_in_path_for(resource)
    new_dashboard_path
  end

  private
  def member_not_authorized
    flash[:alert] = "You aren't authorized to perform that action."
    redirect_to(request.referrer || root_path)
  end

end
