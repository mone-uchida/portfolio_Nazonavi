require 'rails_helper'

RSpec.describe 'Home', type: :request do
  let(:user) { create(:user) }
  let(:title) { create(:title) }
  let(:post) { create(:post) }
  let!(:prefecture) { create(:prefecture) }

  describe 'Home' do
    describe 'ゲストユーザー' do
      it 'GET top' do
        get '/'
        expect(response).to have_http_status(200)
      end

      it 'GET index' do
        get home_path
        expect(response).to have_http_status(200)
        expect(response.body).to_not include '投稿する'
      end
    end
    describe 'ログインユーザー' do
      before do
        allow_any_instance_of(ActionDispatch::Request)
          .to receive(:session)
          .and_return({ user_id: user.id })
      end
      it 'GET index' do
        get home_path
        expect(response).to have_http_status(200)
        expect(response.body).to include '投稿する'
      end
    end
  end
end
