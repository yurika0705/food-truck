class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def new
    @location = Location.find(params.id)
  end

  def create
  end
end
