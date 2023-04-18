class TalksController < ApplicationController
  before_action :set_talks, only: [:index, :create]

  def index
    @talks = Talk.all
    @talks.where(read: false, user_id: current_user.id).update_all(read: true)
    @talk = Talk.new
    @talks.where(read: false, sender_id: @user.id).each(&:mark_as_read!)
    current_user.update(last_accessed_at: Time.current)
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
