require 'rails_helper'

RSpec.describe Event, type: :model do
  let!(:spot) { create(:spot) }
  let!(:title) { create(:title) }
  let!(:other_title) { create(:other_title) }

  describe '登録' do
    describe '登録に成功' do
      it 'title_id,spot_idがある' do
        event = build(:event)
        expect(event).to be_valid
      end
    end

    describe '登録に失敗' do
      it 'title_idがない' do
        event = build(:event, title_id: nil)
        event.valid?
        expect(event.errors[:title_id]).to include("can't be blank")
      end

      it 'spot_idがない' do
        event = build(:event, spot_id: nil)
        event.valid?
        expect(event.errors[:spot_id]).to include("can't be blank")
      end
    end
  end

  describe 'scope' do
    describe 'recent' do
      it 'id順の降順に取得できる' do
        event = create(:event, id: 1)
        event2 = create(:event, id: 2)
        expect(Event.recent[0]).to eq event2
        expect(Event.recent[1]).to eq event
      end
    end

    describe 'open' do
      it '終了日が本日以降のイベントが含まれる' do
        event3 = create(:event, id: 3, finish_at: Date.new(2030, 1, 1))
        expect(Event.open).to include event3
      end

      it '終了日が空欄のイベントが含まれる' do
        event4 = create(:event, id: 4, finish_at: nil)
        expect(Event.open).to include event4
      end

      it '終了日が本日より前のイベントが含まれない' do
        event5 = create(:event, id: 5, finish_at: Date.new(2020, 1, 1))
        expect(Event.open).to_not include event5
      end
    end

    describe 'popular_events' do
      it 'いいねが多い順に取得できる' do
        event10 = create(:event, id: 10)
        event11 = create(:event, id: 11)
        user = create(:user, id: 1)
        user = create(:user, id: 2)
        favorite = create(:favorite, event_id: 10, user_id: 1)
        favorite2 = create(:favorite, event_id: 10, user_id: 2)
        favorite3 = create(:favorite, event_id: 11, user_id: 1)
        expect(Event.popular_events[0]).to eq event10
        expect(Event.popular_events[1]).to eq event11
      end
    end
  end

  describe 'related' do
    it '関連するイベントが含まれる' do
      main_event = create(:event, id: 13, title_id: 1)
      related_event = create(:event, id: 14, title_id: 1)
      unrelated_event = create(:event, id: 15, title_id: 2)
      expect(Event.related(main_event)).to include related_event
      expect(Event.related(main_event)).to_not include unrelated_event
    end
  end
end
