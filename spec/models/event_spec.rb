require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    user = FactoryBot.create(:user)
    room = FactoryBot.create(:room)
    @event = FactoryBot.build(:event, user_id: user, room: room)
  end

  describe 'イベント新規作成' do
    context 'イベント作成できる場合' do
      it '全ての項目が存在すれば登録できる' do
        expect(@event).to be_valid
      end
      it 'textが300文字以下だと登録できる' do
        @event.text = 'a' * 20
        expect(@event).to be_valid
      end
    end
    context 'イベント作成できない場合' do
      it 'nameが空では登録できない' do
        @event.name = ''
        @event.valid?
        expect(@event.errors.full_messages).to include('名前を入力してください')
      end
      it 'placeが空だと作成できない' do
        @event.place = ''
        @event.valid?
        expect(@event.errors.full_messages).to include('場所を入力してください')
      end
      it 'textが空だと作成できない' do
        @event.text = ''
        @event.valid?
        expect(@event.errors.full_messages).to include('概要を入力してください')
      end
      it 'textが301文字以上だと作成できない' do
        @event.text = 'a' * 301
        @event.valid?
        expect(@event.errors.full_messages).to include('概要は300文字以内で入力してください')
      end
      it 'start_timeが空だと作成できない' do
        @event.start_time = ''
        @event.valid?
        expect(@event.errors.full_messages).to include('開始時間を入力してください')
      end
      it 'end_timeが空だと登録できない' do
        @event.end_time = ''
        @event.valid?
        expect(@event.errors.full_messages).to include('終了時間を入力してください')
      end
    end
  end
end
