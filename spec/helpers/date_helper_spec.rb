require 'rails_helper'

describe DateHelper, type: :helper do
  let!(:title) { create(:title) }
  let!(:spot) { create(:spot) }
  let(:event) { create(:event) }
  let!(:other_title) { create(:other_title) }
  let!(:other_spot) { create(:other_spot) }
  let(:other_event) { create(:event, start_at: nil, finish_at: nil) }
  let!(:user) { create(:user) }
  let(:post) { create(:post) }

  describe 'イベントの開催期間' do
    describe '開始日' do
      context '開始日がある場合' do
        it '○年○月○日と表示される' do
          expect(helper.start_at_show(event)).to eq '2020年01月01日'
        end
      end

      context '開始日がない場合' do
        it '-と表示される' do
          expect(helper.start_at_show(other_event)).to eq '-'
        end
      end
    end

    describe '終了日' do
      context '終了日がある場合' do
        it '○年○月○日と表示される' do
          expect(helper.finish_at_show(event)).to eq '2030年01月01日'
        end
      end

      context '終了日がない場合' do
        it '-と表示される' do
          expect(helper.finish_at_show(other_event)).to eq '-'
        end
      end
    end
  end

  describe 'ポストの投稿日時' do
    it '投稿日時が○月○日　○○:○○と表示される' do
      post = Post.create(title_id: 1, user_id: 1, content: ('a' * 50), created_at: Time.current)
      expect(helper.created_at_show(post)).to eq Time.current.strftime('%m月%d日 %H:%M')
    end
  end
end
