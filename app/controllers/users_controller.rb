class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :correct_event
  def show
    @events = Event.where(user_id: current_user.id)
  end


  def correct_user
      @user = User.find(params[:id])
    unless @user.user.id == current_user.id
      redirect_to root_path
    end
  end
  private

  def user_events_params
    params.require(:location).permit(:place, :address, :contact_address, :fee, :info, :image, :prefecture_id, :latitude, :longitude).merge(user_id: current_user.id)
  end

  def set_user
    @user = current_user
  end
end
