require 'rails_helper'

RSpec.describe User, type: :system do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  describe 'User' do
    describe 'ログイン前' do
      describe 'ユーザー新規登録' do
        context 'フォームの入力値が正常' do
          it 'ユーザーの新規作成が成功' do
            visit new_user_path
            fill_in 'user_name', with: 'test'
            fill_in 'user_email', with: 'test@example.com'
            fill_in 'user_password_digest', with: 'password'
            click_button 'アカウントを作成'
            expect(current_path).to eq home_path
            expect(page).to have_content 'アカウントを作成しました'
          end
        end
        context '名前未記入' do
            it 'ユーザーの新規作成が失敗' do
              visit new_user_path
              fill_in 'user_name', with: nil
              fill_in 'user_email', with: 'test@example.com'
              fill_in 'user_password_digest', with: 'password'
              click_button 'アカウントを作成'
              expect(current_path).to eq users_path
              expect(page).to have_content "入力内容にエラーがあります"
            end
          end
        context 'メールアドレス未記入' do
          it 'ユーザーの新規作成が失敗' do
            visit new_user_path
            fill_in 'user_name', with: 'test'
            fill_in 'user_email', with: nil
            fill_in 'user_password_digest', with: 'password'
            click_button 'アカウントを作成'
            expect(current_path).to eq users_path
            expect(page).to have_content "入力内容にエラーがあります"
          end
        end
        context '登録済メールアドレス' do
          it 'ユーザーの新規作成が失敗する' do
            visit new_user_path
            fill_in 'user_name', with: 'test'
            fill_in 'user_email', with: user.email
            fill_in 'user_password_digest', with: 'password'
            click_button 'アカウントを作成'
            expect(current_path).to eq users_path
            expect(page).to have_content "入力内容にエラーがあります"
          end
        end
      end
    end
    describe 'ログイン後' do
      before do
        visit login_path
        fill_in 'email', with: user.email
        fill_in 'password_digest', with: 'password'
        click_button 'ログイン'
      end
      describe 'ユーザー編集' do
        context 'フォームの入力値が正常' do
          it 'ユーザーの編集が成功' do
            visit edit_user_path(user)
            fill_in 'name', with: 'test-edit'
            fill_in 'profile', with: 'test-profile'
            click_button '変更した内容を保存する'
            expect(current_path).to eq edit_user_path(user)
            expect(page).to have_content 'プロフィールを編集しました'
          end
        end
        context 'フォームの入力値が正常' do
          it 'ユーザーの編集が失敗' do
            visit edit_user_path(user)
            fill_in 'name', with: nil
            fill_in 'profile', with: 'test-profile'
            click_button '変更した内容を保存する'
            expect(current_path).to eq user_path(user)
            expect(page).to have_content '変更内容にエラーがあります'
          end
        end
      end
    end
  end
end
