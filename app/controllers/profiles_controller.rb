class ProfilesController < ApplicationController
  respond_to :json, :js, :html

  def index
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
    respond_with @profile
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save!
      redirect_to profile_path(@profile.id)
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
