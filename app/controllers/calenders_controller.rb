class CalendersController < ApplicationController
  before_action :set_calender, only: [:edit, :show, :update, :destroy]

  def index
    @calenders = Calender.all
    @calender = Calender.new
    @locations = Calender.all
  end
  
  def new
    @calender = Calender.new
  end

  def show
    @calender = Calender.find(params[:id])
  end

  def create
    @calender = Calender.new(calender_params)
    if @calender.valid?
      @calender.save
    else
      redirect_to location_calenders_path
    end
  end

  def destroy
    @calender = Calender.find(params[:id])
    @calender.destroy
    redirect_to calenders_path, notice:"削除しました"
  end

  def edit
    @calender = Calender.find(params[:id])
  end

  def update
    @calender = Calender.find(params[:id])
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
