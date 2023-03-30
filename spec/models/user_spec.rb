require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー登録できる場合' do
      it '全ての項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上かつ半角英数字混合であれば登録できる' do
        @user.password = '12345a'
        @user.password_confirmation = '12345a'
        expect(@user).to be_valid
      end
      it 'contextが500文字以下だと登録できる' do
        @user.context = 'a' * 15
        expect(@user).to be_valid
      end

      context 'ユーザー登録できない場合' do
        it 'last_nameが空では登録できない' do
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("名を入力してください。")
        end
        it 'first_nameが空では登録できない' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("姓を入力してください。")
        end
        it 'emailが空だと登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Emailを入力してください。")
        end
        it '重複したemailが存在すると登録できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Emailはすでに存在します")
        end
        it 'emailに@がないと登録できない' do
          @user.email = 'test.com'
          @user.valid?
          expect(@user.errors.full_messages).to include("Emailは不正な値です")
        end
        it 'passwordが空だと登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードを入力してください。")
        end
        it 'passwordは5文字以下だと登録できない' do
          @user.password = '123a'
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください。")
        end
        it 'passwordとpassword_confirmationが不一致では登録できない' do
          @user.password = '12345a'
          @user.password_confirmation = 'abcde1'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmationパスワードが一致しません")
        end
        it 'passwordが英字のみだと登録できない' do
          @user.password = 'abcdef'
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードは半角英数字を含んだ6文字以上で入力してください。")
        end
        it 'passwordが数字のみだと登録できない' do
          @user.password = '123456'
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードは半角英数字を含んだ6文字以上で入力してください。")
        end
        it 'passwordは全角文字を含むパスワードでは登録できない' do
          @user.password = '１234ab'
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードは半角英数字を含んだ6文字以上で入力してください。")
        end
        it 'hobbyが空だと登録できない' do
          @user.hobby = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("趣味を入力してください。")
        end
        it 'contextが空だと登録できない' do
          @user.context = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("自己紹介文を入力してください。")
        end
        it 'contextが301文字以上だと登録できない' do
          @user.context = 'a' * 301
          @user.valid?
          expect(@user.errors.full_messages).to include("自己紹介文は300文字以内で入力してください")
        end
      end
    end
  end
end
