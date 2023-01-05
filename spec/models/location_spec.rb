require 'rails_helper'

RSpec.describe Location, type: :model do
  before do
    @location = FactoryBot.create(:location)
  end
  describe '出店場所の登録' do
    context '登録ができる時' do
      it 'すべての入力事項が存在すれば登録できる' do
        expect(@location).to be_valid
      end
      it '住所の選択が「---」以外であれば登録できる' do
        @location.prefenture_id = 3
        expect(@location).to be_valid
      end
    end
    context '登録ができない時' do
      it 'ユーザー登録をしていないと登録できない' do
        @location.user_id = nill
        @location.valid?
        expect(@location.errors.full_messages).to include('')
      end
    end
  end
end