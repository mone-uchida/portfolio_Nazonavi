require 'rails_helper'

RSpec.describe 'Application', type: :system do
  let(:user) { create(:user) }
  let!(:prefecture) { create(:prefecture) }

  describe 'Header' do
    it 'トップページでは表示されない' do
      visit '/'
      expect(page).to_not have_selector '.header'
    end

    describe 'ユーザーログイン前' do
      it 'ログインと新規登録へのリンクが表示される' do
        visit home_path
        expect(page).to have_selector '#login-link'
        expect(page).to have_selector '#user-new-link'
      end

      it 'ログアウトボタンとユーザーメニューが表示されない' do
        visit home_path
        expect(page).to_not have_selector '#logout'
        expect(page).to_not have_selector '.header-menu'
      end
    end
    describe 'ユーザーログイン後' do
      before { login(user) }
      it 'ログインと新規登録へのリンクが表示されない' do
        visit home_path
        expect(page).to_not have_selector '#login-link'
        expect(page).to_not have_selector '#user-new-link'
      end

      it 'ログアウトボタンとユーザーメニューが表示される' do
        visit home_path
        expect(page).to have_selector '#logout'
        expect(page).to have_selector '.header-menu'
      end
    end
  end
end
