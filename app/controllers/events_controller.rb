class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @room = Room.find(params[:room_id])
    @event = @room.events.new(event_params)
    if @event.save
      redirect_to room_events_path
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :text, :place, :start_time, :end_time).merge(user_id: current_user.id)
  end
end
