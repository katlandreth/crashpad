class GuestRolesController < ApplicationController
  respond_to :json, :js

  def index
  end

  def show
  end

  def new
    @guest = GuestRole.new
    respond_with @guest
  end

  def create
    @guest = GuestRole.new(guest_params)
    # if @guest.save!
    #   redirect_to controller: 'profile', action: 'new'
    # else
    #   render 'new'
    # end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def guest_params
    params.require(:guest_role).permit(:smoking_preference, :pet_preference, :member_id)
  end
end
