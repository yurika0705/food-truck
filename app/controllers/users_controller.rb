class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  def show
    @user = current_user
    @events = Event.where(user_id: @user.id)
  end

  private
  
  def set_user
    @user = current_user
  end
end
