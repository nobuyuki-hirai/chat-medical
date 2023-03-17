class RoomsController < ApplicationController
  def index
    @room_lists = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end
end
