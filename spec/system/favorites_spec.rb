require 'rails_helper'

RSpec.describe Favorite, type: :system, js: true do
  let!(:user) { create(:user) }
  let(:event) { create(:event) }
  let!(:spot) { create(:spot) }
  let!(:title) { create(:title) }

  describe 'Favorite' do
    describe 'いいね機能' do
      describe 'ログイン前' do
        context 'いいねをクリックした場合' do
          it 'ログイン画面へ遷移する' do
            visit event_path(event)
            find('#favorite-new-user').click
            expect(current_path).to eq new_user_path
          end
        end
      end
      describe 'ログイン後' do
        before { login(user) }
        context 'いいねをクリックした場合' do
          it 'いいねの追加と解除ができる' do
            visit event_path(event)
            find('#favorite-create').click
            expect(page).to have_css '#favorite-destroy'
            find('#favorite-destroy').click
            expect(page).to have_css '#favorite-create'
          end
        end
      end
    end
  end
end
