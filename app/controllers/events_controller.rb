class EventsController < ApplicationController
  before_action :authenticate_user!
  def index
    @event = Event.new
    @location = Location.find(params[:location_id])
    @events = Event.where(location_id: @location.id)
  end

  def new
    @event = Event.new
  end

  def show
    case params[:order_sort]
    when '1'
      @location = Location.find(params[:location_id])
      @event = Event.find(params[:event_id])
      @user = User.find(params[:id])
    else
      @location = Location.find(params[:location_id])
      @event = Event.find(params[:id])
    end
  end

  def create
    @location = Location.find(params[:location_id])
    @event = @location.events.new(event_parameter)
    if @event.valid?
      @event.save
      redirect_to location_events_path, notice: '登録しました'
    else
      redirect_to location_events_path
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if user_signed_in? && (current_user.id == @event.user_id)
      @event.destroy
      redirect_to location_events_path(@event.location_id), notice: '削除しました'
    else
      render location_events_path(@event.location_id), notice: '削除できませんでした'
    end
  end

  private

  def event_parameter
    params.require(:event).permit(:title, :start_time).merge(user_id: current_user.id, location_id: params[:location_id])
  end
end
