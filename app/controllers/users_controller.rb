class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  end

  def show
    @user = User.find(params[:id])
    @job = Job.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :hobby, :context, :job_id, :image, :user_id)
  end
end
