class EventsController < ApplicationController
  def index
    @event = Event.new
    @location = Location.find(params[:location_id])
    @events = Event.where(location_id: @location.id)
  end
  
  def new
    @event = Event.new
  end

  def show
    @location = Location.find(params[:location_id])
    @event = Event.find(params[:id])
  end

  def create
    @location = Location.find(params[:location_id])
    @event = @location.events.new(event_parameter)
    if @event.valid?
      @event.save
      redirect_to location_events_path, notice:"登録しました"
    else
      redirect_to location_events_path
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to location_events_path(@event.location_id), notice:"削除しました"
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_parameter)
      redirect_to location_event_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def event_parameter
    params.require(:event).permit(:title, :start_time).merge(user_id: current_user.id, location_id: params[:location_id])
  end

end