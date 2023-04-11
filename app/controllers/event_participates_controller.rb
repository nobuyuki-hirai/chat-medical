class EventParticipatesController < ApplicationController
  before_action :authenticate_user!

  def create
    @event_participate = EventParticipate.new(event_id: params[:event_id], user_id: current_user.id)
    if @event_participate.save
      flash[:success] = "参加しました。"
    else
      flash[:danger] = "参加に失敗しました。"
    end
    redirect_to room_events_path
  end

  def destroy
    @event_participate = EventParticipate.find_by(event_id: params[:event_id], user_id: current_user.id)
    if @event_participate.destroy
      flash[:success] = "参加を取り消しました。"
    else
      flash[:danger] = "参加の取り消しに失敗しました。"
    end
    redirect_to room_events_path
  end
end

