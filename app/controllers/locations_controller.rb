class LocationsController < ApplicationController

  def index
    @locations = Location.where(user_id: current_user)
    @hash = Gmaps4rails.build_markers(@location) do |location, marker|
      marker.lat location.latitude
      marker.lng location.longitude
    end
  end

  def new
    @location = current_user.locations.build
  end

  def create
    @location = current_user.locations.build(location_params)
    if @location.save
      flash[:success] = "Location was successfully created."
      redirect_to @location
    else
      flash[:danger] = "Location has not been created."
      render :new
    end
  end

  def show
    @location = Location.find(params[:id])
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    if @location.update_attributes(location_params)
      flash[:success] = "Location was successfully updated."
      redirect_to @location
    else
      flash[:danger] = "Location has not been updated."
      render :edit
    end
  end

  def destroy
    @user = current_user
    @location = Location.find(params[:id])
    if @location.destroy
      flash[:success] = "Location has been deleted."
      redirect_to locations_path
    end
  end

  private

  def location_params
    params.require(:location).permit(:address, :city, :state, :zip_code, :latitude, :longitude)
  end
end
