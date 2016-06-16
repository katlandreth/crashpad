class MembersController < ApplicationController
  before_action :authenticate_member!
  respond_to :json, :js, :html


  def index
  end

  def show
    @member = Member.find(params[:member_id])
  end

end
