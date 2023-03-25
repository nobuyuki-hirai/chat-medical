class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :set_user, only: [:show, :edit, :update]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
  end

  def update
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      @user.assign_attributes(user_params.except(:password, :password_confirmation))
    else
      @user.assign_attributes(user_params)
    end

    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :hobby, :context, :job_id, :image, :user_id)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
