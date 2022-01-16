require 'rails_helper'

RSpec.describe 'Event', type: :system do
  let!(:spot) { create(:spot) }
  let!(:title) { create(:title) }
  let!(:event) { create(:event) }
  let!(:finished_title) { create(:finished_title) }
  let!(:finished_event) { create(:finished_event) }
  let!(:other_spot) { create(:other_spot) }
  let!(:other_title) { create(:other_title) }
  let!(:other_event) { create(:other_event) }
  let!(:related_spot) { create(:related_spot) }
  let!(:related_event) { create(:related_event) }

  describe 'Event' do
    describe 'Index' do
      before do
        visit events_path
      end
      it '開催中のイベントが表示される' do
        expect(page).to have_content title.name
      end

      it '終了済のイベントが表示されない' do
        expect(page).to_not have_content finished_title.name
      end

      it 'イベント詳細ページへのリンクが有効である' do
        click_link other_title.name
        expect(current_path).to eq event_path(other_event)
      end

      it '会場詳細ページへのリンクが有効である' do
        click_link other_spot.place
        expect(current_path).to eq spot_path(other_spot)
      end
    end

    describe 'Show' do
      before do
        visit events_path(event)
      end
      describe '詳細ページが表示される' do
        it 'イベント情報が表示される' do
          expect(page).to have_content title.name
          expect(page).to have_content event.start_at.strftime('%Y年%m月%d日')
          expect(page).to have_content event.finish_at.strftime('%Y年%m月%d日')
          expect(page).to have_content spot.place
          expect(page).to have_content title.source
        end

        it '別会場のイベントが表示される' do
          expect(page).to have_content other_spot.place
          expect(page).to have_content related_event.finish_at.strftime('%Y年%m月%d日')
        end
      end
    end

    describe 'イベント検索' do
      describe 'エリア検索' do
        context '該当するイベントがある場合' do
          it 'イベント一覧に遷移する' do
            visit home_path
            fill_in 'address', with: '東京都'
            find('#address-submit').click
            expect(page).to have_content title.name
          end

          it '該当しないイベントが表示されない' do
            visit home_path
            fill_in 'address', with: '東京都'
            find('#address-submit').click
            expect(page).to_not have_content other_title.name
          end
        end

        context '該当するイベントがない場合' do
          it 'ホーム画面に遷移する' do
            visit home_path
            fill_in 'address', with: 'ニューヨーク'
            find('#address-submit').click
            expect(current_path).to eq home_path
            expect(page).to have_content '該当するイベントがありませんでした'
          end
        end
      end

      describe 'フリーワード検索' do
        context '該当するイベントがある場合' do
          it 'イベント一覧に遷移する' do
            visit home_path
            fill_in 'search', with: 'なぞ'
            find('#search-submit').click
            expect(page).to have_content title.name
          end

          it '該当しないイベントが表示されない' do
            visit home_path
            fill_in 'search', with: 'なぞ'
            find('#search-submit').click
            expect(page).to_not have_content other_title.name
          end
        end

        context '該当するイベントがない場合' do
          it 'ホーム画面に遷移する' do
            visit home_path
            fill_in 'search', with: '花火'
            find('#search-submit').click
            expect(current_path).to eq home_path
            expect(page).to have_content '該当するイベントがありませんでした'
          end
        end
      end
    end
  end
end
