class ProfilesController < ApplicationController
  respond_to :json, :js, :html

  def index
  end

  def show
  end

  def new
    @profile = Profile.new
    respond_with @profile
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save!
      redirect_to profile_path(:id)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :smoker, :pet_owner, :member_id)
  end
end
