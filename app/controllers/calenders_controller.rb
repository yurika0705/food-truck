class CalendersController < ApplicationController
  before_action :set_calender, only: [:edit, :show, :update, :destroy]

  def index
    @calender = Calender.new
    @location = Location.find(params[:location_id])
    @calenders = Calender.find(params[:location_id])
  end
  
  def new
    @calender = Calender.new
    @location = Location.find(params[:location_id])
  end

  def show
  end

  def create
    @location = Location.find(params[:location_id])
    @calender = @location.calenders.new(calender_params)
    if @calender.valid?
      @calender.save
    else
      redirect_to location_calenders_path
    end
  end

  def destroy
    @calender.destroy
    redirect_to calenders_path, notice:"削除しました"
  end

  def edit
  end

  def update
    if @calender.update(calender_parameter)
      redirect_to calenders_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def calender_params
    params.require(:calender).permit(:start_time, :store_name).merge(user_id: current_user.id, location_id: params[:location_id])
  end

  def set_calender
    @calender = Calender.find(params[:id])
  end
end
