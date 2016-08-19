class LocationsController < ApplicationController
  respond_to :json, :js, :html

  def index
    if current_member.has_host_role?
      @locations = Location.where(host_role_id: current_member.role.id)
    else
      @locations = Location.all
    end
  end

  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new()
    respond_with @location
  end

  def create
    @location = Location.new(location_params)
    if @location.save!
      flash[:success] = 'location saved!'
      redirect_to @location
    end
  end

  def destroy
    Location.find(params[:id]).destroy
    flash[:success] = "Location deleted"
    redirect_to locations_path
  end


  private

  def location_params
    params.require(:location).permit(:name, :location_street, :location_city, :location_zip, :host_role_id, :max_occupants);
  end
end
