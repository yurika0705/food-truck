class CalendersController < ApplicationController

  def index
    @calenders = Calender.all
    @calender = Calender.new
  end
  
  def new
    @calender = Calender.new
  end

  def show
    @calender = Calender.find(params[:id])
  end

  def create
    Calender.create(calender_parameter)
    redirect_to calenders_path
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

  def calender_parameter
    params.require(:calender).permit(:store_name, :start_time)
  end
end
