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
    @images = @location.location_images.all
  end

  def new
    @location = Location.new()
    @image = @location.location_images.build
    respond_with @location
  end

  def create
    @location = Location.new(location_params)
    if @location.save!
      params[:location_images]['image'].each do |img|
          @location_image = @location.location_images.create!(:image => img)
       end
      flash[:success] = 'location saved!'
      redirect_to @location
    end
  end

  def update
    @location = Location.find(params[:id])
    @image = LocationImage.new(location_params[:image])
    if @location.update_attributes(location_params)
      params[:location_images]['image'].each do |img|
          @location_image = @location.location_images.create!(:image => img)
       end
      flash[:success] = 'location saved!'
      redirect_to @location
    end
  end

  def destroy
    Location.find(params[:id]).destroy
    flash[:success] = "Location deleted"
    redirect_to locations_path
  end

  def delete_image
    LocationImage.find(params[:id]).destroy
    flash[:success] = "image deleted"
    redirect_to location_path(id: params[:location_id])
  end

  private

  def location_params
    params.require(:location).permit(:name, :location_street, :location_city,
    :location_zip, :host_role_id, :max_occupants, location_image_attributes: [:id, :location_id, :image]);
  end
end
