require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @location = FactoryBot.create(:location)
    @event = FactoryBot.build(:event, user_id: @user.id, location_id: @location.id)
    sleep(1)
  end

  describe '予定の登録' do
    context '予定の登録ができる時' do
      it 'すべての項目が存在すれば登録できる' do
        expect(@event).to be_valid
      end
    end
    context '予定の登録ができない時' do
      it 'タイトルがないと登録できない' do
        @event.title = nil
        @event.valid?
        expect(@event.errors.full_messages).to include("Titleを入力してください")
      end
      it '日時がないと登録できない' do
        @event.start_time = nil
        @event.valid?
        expect(@event.errors.full_messages).to include("Start timeを入力してください")
      end
    end
  end
end