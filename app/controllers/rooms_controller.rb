class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :show]
  before_action :set_rooms, only: [:show, :edit, :update]

  def index
    @rooms = if user_signed_in?
               current_user.rooms.includes(:users)
             else
               Room.none
             end
    if user_signed_in?
      @room = current_user.rooms.includes(:users)
    else
      redirect_to new_user_registration_path
    end
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

  def update
    if @room.update(room_params)
      redirect_to room_path(@room)
    else
      render :edit
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, :image, user_ids: [])
  end

  def set_rooms
    @room = Room.find(params[:id])
  end
end
