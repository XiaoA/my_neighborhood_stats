class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    @location.save
     redirect_to @location, notice: 'Location was successfully created.'
   end

  def show
    @location = Location.find(params[:id])
  end
  
  private

  def location_params
    params.require(:location).permit(:address, :city, :state, :zip_code, :latitude, :longitude)
  end
end
