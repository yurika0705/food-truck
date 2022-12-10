class LocationsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  # def create
  #   @location = Location.new(location_params)
  #   if @location.valid?
  #     binding.pry
  #     @location.save
  #     redirect_to root_path
  #   else
  #     render :new
  #   end
  # end

private
  def location_params
    params.require(:location).permit(:place, :address, :contact_address, :fee, :info).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end