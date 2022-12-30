class UsersController < ApplicationController
  before_action :correct_user
  def show
    user_events_params
    @events = Event.where(user_id: current_user.id)
    @location = Location.find(params[:location_id])
  end


  def correct_user
      @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to root_path
    end
  end
  private

  def user_events_params
    params.require(:events).permit(:title, :start_time).merge(location_id: params[:location_id], user_id: current_user.id)
  end
end
