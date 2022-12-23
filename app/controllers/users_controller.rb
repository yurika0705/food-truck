class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  def show
    @events = Event.where(user_id: @user.id)
  end

  private

  def user_events_params
    params.require(:location).permit(:place, :address, :contact_address, :fee, :info, :image, :prefecture_id, :latitude, :longitude).merge(user_id: current_user.id)
  end

  def set_user
    @user = current_user
  end
end
