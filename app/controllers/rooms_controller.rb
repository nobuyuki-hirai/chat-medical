class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :show]
  before_action :set_rooms, only: [:show, :edit]

  def index
    @rooms = current_user.rooms.includes(:users)
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)

    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @users = @room.users
  end

  def edit
  end

  private

  def room_params
    params.require(:room).permit(:name, :image, user_ids: [])
  end

  def set_rooms
    @room = Room.find(params[:id])
  end
end
