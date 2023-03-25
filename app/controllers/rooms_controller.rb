class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :show]

  def index
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
    @room = Room.find(params[:id])
    @users = @room.users
  end

  private

  def room_params
    params.require(:room).permit(:name, :image, user_ids: [])
  end
end
