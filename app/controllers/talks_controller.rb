class TalksController < ApplicationController
  before_action :set_talks, only: [:index, :create]

  def index
    @talks = Talk.where("(user_id = ? AND sender_id = ?) OR (user_id = ? AND sender_id = ?)", current_user.id, @user.id, @user.id, current_user.id)
    @talks.where(read: false, user_id: current_user.id).update_all(read: true)
    @talks.where(read: false, sender_id: @user.id).each(&:mark_as_read!)
    @talk = Talk.new
  end  

  def create
    @talk = Talk.new(talk_params)
    if @talk.save
      redirect_to user_talks_path(@user)
    else
      flash.now[:alert] = 'メッセージを送信できませんでした。'
      render 'index'
    end
  end

  private

  def talk_params
    params.require(:talk).permit(:text, :image, :sender_id, :user_id).merge(sender_id: current_user.id, user_id: @user.id)
  end

  def set_talks
    @user = User.find(params[:user_id])
  end
end
