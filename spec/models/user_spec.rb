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
      it 'contextが100文字以下だと登録できる' do
        @user.context = 'a' * 15
        expect(@user).to be_valid
      end

      context 'ユーザー登録できない場合' do
        it 'last_nameが空では登録できない' do
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end
        it 'first_nameが空では登録できない' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end
        it 'emailが空だと登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it '重複したemailが存在すると登録できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
        it 'emailに@がないと登録できない' do
          @user.email = 'test.com'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end
        it 'passwordが空だと登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it 'passwordは5文字以下だと登録できない' do
          @user.password = '123a'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end
        it 'passwordとpassword_confirmationが不一致では登録できない' do
          @user.password = '1234a'
          @user.password_confirmation = 'abcd1'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it 'passwordが英字のみだと登録できない' do
          @user.password = 'abcdef'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid')
        end
        it 'passwordが数字のみだと登録できない' do
          @user.password = '123456'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid')
        end
        it 'passwordは全角文字を含むパスワードでは登録できない' do
          @user.password = '１234ab'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid')
        end
        it 'job_idに「---」が選択されている場合は出品できない' do
          @user.job_id = '1'
          @user.valid?
          expect(@user.errors.full_messages).to include("Job can't be blank")
        end
        it 'hobbyが空だと登録できない' do
          @user.hobby = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Hobby can't be blank")
        end
        it 'contextが空だと登録できない' do
          @user.context = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Context can't be blank")
        end
        it 'contextが101文字以上だと登録できない' do
          @user.context = 'a' * 101
          @user.valid?
          expect(@user.errors.full_messages).to include("Context is too long (maximum is 100 characters)")
        end
      end
    end
  end
end

