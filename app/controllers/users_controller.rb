class UsersController < ApplicationController
  before_action :correct_user
  def show
    @events = Event.where(user_id: current_user.id)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to root_path unless @user.id == current_user.id
  end

  private

  def user_events_params
    params.require(:location).permit(:place, :address, :contact_address, :fee, :info, :image, :prefecture_id, :latitude,
                                     :longitude).merge(user_id: current_user.id)
  end
end
