class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    Event.create(event_parameter)
    redirect_to root_path
  end

  private

  def event_parameter
    params.require(:event).permit(:title, :start_time)
  end
end
