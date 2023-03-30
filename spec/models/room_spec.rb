require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    users = FactoryBot.create_list(:user, 3)
    @room = FactoryBot.build(:room, user_ids: users.map(&:id))
  end

  describe 'チャットルーム新規作成' do
    context 'チャットルームが作成できる場合' do
      it '全ての項目が存在すれば作成できる' do
        expect(@room).to be_valid
      end
      it '招待するユーザーが2名以上選択すれば作成できる' do
        expect(@room).to be_valid
      end
    end
    context 'チャットルームが作成できない場合' do
      it 'nameが空だと作成できない' do
        @room.name = ""
        @room.valid?
        expect(@room.errors.full_messages).to include("チャットルーム名を入力してください")
      end

      it '招待するユーザーが1名以下の場合、作成できない' do
        @room.user_ids = [@room.creator.id]
        @room.valid?
        expect(@room.errors.full_messages).to include("招待するユーザーを2名以上選択してください")
      end
    end
  end
end
