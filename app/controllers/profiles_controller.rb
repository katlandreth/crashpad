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
      flash[:notice] = 'Your profile was created'
      redirect_to member_path(@profile.member_id)
    else
      flash.now[:notice] = 'Woops! Your profile wasn\'t created.'
      render 'new'
    end
  end

  def edit
    @profile = current_member.profile
  end

  def update
    @profile = current_member.profile
    if @profile.update_attributes(profile_params)
      flash[:success] = 'Your profile was updated.'
      redirect_to member_path(@profile.member_id)
    else
      flash[:error] = 'Woops, something wen\'t wrong. Your profile was not updated.'
    end
  end

  def destroy
  end

  def remove_image
    @profile = current_member.profile
    @profile.remove_image!
    if @profile.save
      flash[:success] = 'The image was deleted.'
      redirect_to member_path(@profile.member_id)
    else
      flash[:error] = 'Something went wrong, the image was not deleted.'
      redirect_to member_path(@profile.member_id)
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :smoker, :pet_owner, :member_id, :image)
  end
end
