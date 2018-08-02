class LocationsController < ApplicationController

  def create
    location = Location.new()
  end

  private

  def location_params
    
  end

end
