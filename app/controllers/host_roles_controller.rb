class HostRolesController < ApplicationController
  respond_to :json, :js

  def index
  end

  def show
  end

  def new
    @host = HostRole.new
    respond_with @host
  end

  def create
    @host = HostRole.new(host_params)
    if @host.save!
      flash[:success] = "Congrats, you're now a guest."
      redirect_to controller: 'profiles', action: 'new'
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

  def host_params
    params.require(:host_role).permit(:smoking_preference, :pet_preference, :member_id)
  end
end
