require 'rails_helper'

RSpec.describe 'Favorite', type: :request do
  let(:user) { create(:user) }
  let(:title) { create(:title) }
  let(:post) { create(:post) }

  describe 'Favorite' do
    describe 'ログインユーザー' do
      before do
        allow_any_instance_of(ActionDispatch::Request)
          .to receive(:session)
          .and_return({ user_id: user.id })
      end

      it 'GET index' do
        get user_favorites_path(user)
        expect(response).to have_http_status(200)
      end
    end
  end
end
