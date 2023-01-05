require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
    sleep(1)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it 'すべての項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上かつ半角英数字が入っていれば登録できる' do
        @user.password = '12345a'
        @user.password_confirmation = '12345a'
        expect(@user).to be_valid
      end
    end
    context '新規登録できない時' do
      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nameを入力してください"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "メールアドレスを入力してください"
      end
      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードを入力してください"
      end
      it '確認用パスワードが同じでなければ登録できない' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'aaa222'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('メールアドレスはすでに存在します')
      end
    end
  end
end
