class EventsController < ApplicationController
  before_action :set_events, only: [:index, :create, :show]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = @room.events.new(event_params)
    @event.organizer = current_user
    if @event.save
      redirect_to room_events_path
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    @event_participates = @event.event_participates.includes(:user)
  end

  private

  def set_events
    @room = Room.find(params[:room_id])
  end

  def event_params
    params.require(:event).permit(:name, :text, :place, :start_time, :end_time).merge(user_id: current_user.id)
  end
end
