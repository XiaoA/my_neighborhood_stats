class LocationsController < ApplicationController
  
  def index
    @locations = Location.where(user_id: current_user)
  end

  def new
    @location = current_user.locations.build
  end

  def create
    @location = current_user.locations.build(location_params)
    @location.save
     redirect_to @location, notice: "Location was successfully created."
   end

  def show
    @location = Location.find(params[:id])    
  end
  
  private

  def location_params
    params.require(:location).permit(:address, :city, :state, :zip_code, :latitude, :longitude)
  end
end
