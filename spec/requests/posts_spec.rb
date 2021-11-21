require 'rails_helper'

RSpec.describe 'User', type: :request do
  let(:user) { create(:user) }
  let(:title) { create(:title) }
  let(:post) { create(:post) }

  describe 'Post' do
    it 'GET index' do
      get posts_path
      expect(response).to have_http_status(200)
    end

    describe 'ログインユーザー' do
      before do
        allow_any_instance_of(ActionDispatch::Request)
          .to receive(:session)
          .and_return({ user_id: user.id })
      end
      it 'GET new' do
        get new_post_path(user)
        expect(response).to have_http_status(200)
      end
    end
  end
end
