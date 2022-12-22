class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  def show
    @user = current_user
    @events = Event.where(user_id: @user.id)
  end

  private

  def event_params
		params.require(:event).permit(:title).merge(location_id: params[:location_id])
	end

  def location_params
    params.require(:location).permit(:plase, :address, :contact_address, :fee, :info, :image, :prefecture_id, :latitude, :longitude)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
