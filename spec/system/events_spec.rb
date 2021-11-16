require 'rails_helper'

RSpec.describe "Event", type: :system do
  let!(:spot) { create(:spot) }
  let!(:title) { create(:title) }
  let!(:event) { create(:event) }

  describe 'Event' do
    describe 'エリア検索' do
      context '該当するイベントがある場合' do
        it 'イベント一覧に遷移する' do
          visit home_path
          fill_in 'address', with: '東京都'
          find('#address-submit').click
          expect(page).to have_content title.name
        end
      end

      context '該当するイベントがない場合' do
        it 'ホーム画面に遷移する' do
          visit home_path
          fill_in 'address', with: 'ニューヨーク'
          find('#address-submit').click
          expect(current_path).to eq home_path
          expect(page).to have_content "該当するイベントがありませんでした"
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
      end

      context '該当するイベントがない場合' do
        it 'ホーム画面に遷移する' do
          visit home_path
          fill_in 'address', with: '花火'
          find('#search-submit').click
          expect(current_path).to eq home_path
          expect(page).to have_content "該当するイベントがありませんでした"
        end
      end
    end
  end
end
