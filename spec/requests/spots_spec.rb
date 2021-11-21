require 'rails_helper'

RSpec.describe 'Spot', type: :request do
  let(:spot) { create(:spot) }

  describe 'Event' do
    it 'GET show' do
      get spot_path(spot)
      expect(response).to have_http_status(200)
    end
  end
end
