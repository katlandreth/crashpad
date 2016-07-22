class ProfilesController < ApplicationController
  respond_to :json, :js, :html
  before_action :authenticate_member!
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :authorize_profile, only: [:index, :show, :edit, :update, :destroy]

  def index
    @profiles = Profile.all
  end

  def show
    render plain: '¯\_(ツ)_/¯'
  end

  def new
    @profile = Profile.new
    authorize @profile
    respond_with @profile
  end

  def create
    @profile = Profile.new(profile_params)
    authorize @profile
    if @profile.save!
      flash[:notice] = 'Your profile was created'
      redirect_to new_dashboard_path
    else
      flash.now[:notice] = 'Woops! Your profile wasn\'t created.'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @profile.update_attributes(profile_params)
      flash[:success] = 'Your profile was updated.'
      redirect_to new_dashboard_path
    else
      flash[:error] = 'Woops, something wen\'t wrong. Your profile was not updated.'
      redirect_to new_dashboard_path
    end
  end

  def destroy
  end

  def remove_image
    @profile = current_member.profile
    @profile.remove_image!
    if @profile.save
      flash[:success] = 'The image was deleted.'
      redirect_to new_dashboard_path
    else
      flash[:error] = 'Something went wrong, the image was not deleted.'
      redirect_to new_dashboard_path
    end
  end

  private

  def set_profile
    @profile = current_member.profile
  end

  def authorize_profile
    authorize @profile
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :smoker, :pet_owner, :member_id, :image, :bio)
  end
end
