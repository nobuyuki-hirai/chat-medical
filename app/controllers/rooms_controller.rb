class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :show]
  before_action :set_rooms, only: [:show, :edit, :update, :destroy]

  def index
    @rooms = if user_signed_in?
               current_user.rooms.includes(:users)
             else
               Room.none
             end
    @q = @rooms.ransack(params[:q])
    @rooms = @q.result(distinct: true)
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.creator = current_user
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @users = @room.users
    @message = Message.new
    @messages = @room.messages.includes(:user)
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

  def destroy
    if @room.destroy
      redirect_to root_path
    else
      render :show
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
