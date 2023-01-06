require 'rails_helper'

RSpec.describe Location, type: :model do
  before do
    @location = FactoryBot.create(:location)
  end
  describe '出店場所の登録' do
    context '登録ができる時' do
      it '場所名・住所・連絡先が存在すれば登録できる' do
        expect(@location).to be_valid
      end
      it '住所の選択が「---」以外であれば登録できる' do
        @location.prefecture_id = 3
        expect(@location).to be_valid
      end
    end
    context '登録ができない時' do
      it 'ユーザー登録をしていないと登録できない' do
        @location.user_id = nil
        @location.valid?
        expect(@location.errors.full_messages).to include('Userを入力してください')
      end
      it '場所名がないと登録できない' do
        @location.place = nil
        @location.valid?
        expect(@location.errors.full_messages).to include("Placeを入力してください")
      end
      it '県のカテゴリー選択がされていないと登録できない' do
        @location.prefecture_id = nil
        @location.valid?
        expect(@location.errors.full_messages).to include("Prefectureを入力してください")
      end
      it '住所がないと登録できない' do
        @location.address = nil
        @location.valid?
        expect(@location.errors.full_messages).to include("Addressを入力してください")
      end
      it '連絡先がないと登録できない' do
        @location.contact_address = nil
        @location.valid?
        expect(@location.errors.full_messages).to include("Contact addressを入力してください")
      end
      it '県に「---」が選択されている場合は登録できない' do
        @location.prefecture_id = 0
        @location.valid?
        expect(@location.errors.full_messages).to include("Prefectureを選択してください")
      end
    end
  end
end