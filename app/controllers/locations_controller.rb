class LocationsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_location, only: [:edit, :show, :update, :destroy]
  before_action :my_location, only: [:edit, :destroy]

  def index
    @locations = Location.all
    @location1 = Location.where(prefecture_id: 1)
    @location2 = Location.where(prefecture_id: 2)
    @location3 = Location.where(prefecture_id: 3)
    @location4 = Location.where(prefecture_id: 4)
    @location5 = Location.where(prefecture_id: 5)
    @location6 = Location.where(prefecture_id: 6)
    binding.pry
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    binding.pry
    if @location.valid?
      @location.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @location.update(location_params)
      render :update
    else
      redirect_to :edit
    end
  end
  
  def destroy
    @location.destroy
    redirect_to root_path
  end

private
  def location_params
    params.require(:location).permit(:place, :address, :contact_address, :fee, :info, :image, :prefecture_id, :latitude, :longitude).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def set_location
    @location = Location.find(params[:id])
  end

  def my_location
    @location.user_id == current_user.id
  end
end