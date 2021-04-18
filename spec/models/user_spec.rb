require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    # ユーザー情報のexampleの整理
    context '新規登録できるとき' do
      it 'メールアドレスは、@を含む必要がある' do
        @user.email = '0@0'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが６文字以上あれば登録できる' do
        @user.password = 'aaaaa0'
        @user.password_confirmation = 'aaaaa0'
        expect(@user).to be_valid
      end
      it 'passwordは半角英数混合であれば登録できる' do
        @user.password = 'aaaaa0'
        @user.password_confirmation = 'aaaaa0'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが一致すれば登録できる' do
        @user.password = @user.password_confirmation
        expect(@user).to be_valid
      end
      it 'prefectureのidが2~48なら保存できる' do
        @user.prefecture_id = 2
        expect(@user).to be_valid
      end


    end
    context '新規登録できないとき' do
      it 'ニックネームが空では登録できない' do
        @user.username = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Username can't be blank"
      end
      it 'メールアドレスが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailがある場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password = '000000'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'prefectureが1では保存できない' do
        @user.prefecture_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("Prefecture is out of setting range")
      end
    end
  end
end
