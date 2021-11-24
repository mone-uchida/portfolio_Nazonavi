require 'rails_helper'

RSpec.describe SessionsHelper, type: :helper do
  let(:user) { create(:user) }

  it 'ログイン時にuser.idがセッションされる' do
    helper.log_in(user)
    session[:user_id] == user.id
  end

  describe 'ログインしている場合' do
    before do
      helper.log_in(user)
    end

    it 'current_userがログインユーザーと等しい' do
      helper.current_user
      @current_user == user
    end

    it 'ログインしていることを判別ができる' do
      helper.logged_in? == true
    end

    it 'ログアウト時にセッションを解除できる' do
      helper.log_out
      @current_user.nil?
    end
  end

  describe 'ログインしていない場合' do
    it 'ログインしていないことを判別できる' do
      helper.logged_in? == false
    end
  end
end
