require 'rails_helper'

RSpec.describe Post, type: :system do
  let!(:user) { create(:user, id: 1) }
  let!(:other_user) { create(:user, id: 2) }
  let!(:title) { create(:nazo, id: 1) }
  let!(:other_title) { create(:escape, id: 2) }
  let!(:post) { create(:post, id: 1, user_id: 1, title_id: 1) }
  let!(:other_post) { create(:other_post, id: 2, user_id: 2, title_id: 2) }

  describe 'Post' do
    describe 'ユーザーがログイン' do
      before do
        visit login_path
        fill_in 'email', with: user.email
        fill_in 'password_digest', with: 'password'
        click_button 'ログイン'
      end
      describe '投稿機能' do
        context 'フォームの入力値が正常' do
          it '投稿が成功' do
            visit new_post_path
            find('#post_title_id').click
            select "なぞとき", from: "post_title_id"
            fill_in 'post_content', with: '楽しかった！'
            click_button '投稿する'
            expect(current_path).to eq users_posts_index_path(user)
            expect(page).to have_content '投稿が完了しました'
          end
        end
        context '投稿内容が未記入' do
          it '投稿が失敗' do
            visit new_post_path
            find('#post_title_id').click
            select "なぞとき", from: "post_title_id"
            fill_in 'post_content', with: nil
            click_button '投稿する'
            expect(current_path).to eq posts_path
            expect(page).to have_content "入力内容にエラーがあります"
          end
        end
        context 'タイトルが未選択' do
          it '投稿が失敗' do
            visit new_post_path
            fill_in 'post_content', with: '楽しかった！'
            click_button '投稿する'
            expect(current_path).to eq posts_path
            expect(page).to have_content "入力内容にエラーがあります"
          end
        end
      end
      describe '編集機能' do
        describe '自分の投稿を編集' do
          context 'フォームの入力値が正常' do
            it '投稿の編集が成功' do
              visit edit_post_path(user.posts.ids.first)
              find('#post_title_id').click
              select "脱出", from: "post_title_id"
              fill_in 'post_content', with: '脱出できた！'
              click_button '編集を保存する'
              expect(current_path).to eq users_posts_index_path(user)
              expect(page).to have_content '編集が完了しました'
            end
          end
          context '投稿内容が未記入' do
            it '投稿の編集が失敗' do
              visit edit_post_path(user.posts.ids.first)
              select "脱出", from: "post_title_id"
              fill_in 'post_content', with: nil
              click_button '編集を保存する'
              expect(current_path).to eq post_path(user.posts.ids.first)
              expect(page).to have_content '入力内容にエラーがあります'
            end
          end
        end
        describe '他のユーザーの投稿を編集' do
          it '投稿の編集が失敗' do
            visit edit_post_path(other_user.posts.ids.first)
            find('#post_title_id').click
            select "脱出", from: "post_title_id"
            fill_in 'post_content', with: '脱出できなかった…'
            click_button '編集を保存する'
            expect(current_path).to eq posts_path
            expect(page).to have_content '他のユーザーの投稿は編集できません'
          end
        end
      end
      describe '削除機能' do
        describe '投稿を削除' do
          it '削除が成功' do
            visit users_posts_index_path(user)
            find("#delete-#{user.posts.ids.first}").click
            expect(current_path).to eq users_posts_index_path(user)
            expect(page).to have_content '投稿を削除しました'
          end
        end
      end
    end
  end
end
