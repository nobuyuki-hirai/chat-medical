class EventsController < ApplicationController
  before_action :set_events, only: [:index, :create, :show, :edit, :update, :destroy]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

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
    @event_participates = @event.event_participates.includes(:user)
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to room_events_path
    else
      render :edit
    end
  end

  def destroy
    if @event.destroy
      redirect_to room_events_path
    else
      render :show
    end
  end

  private

  def set_events
    @room = Room.find(params[:room_id])
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :text, :place, :start_time, :end_time).merge(user_id: current_user.id)
  end
end
