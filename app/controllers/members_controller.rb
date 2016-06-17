class MembersController < ApplicationController
  before_action :authenticate_member!
  respond_to :json, :js, :html


  def index
  end

  def show
    @member = current_member
  end

end
