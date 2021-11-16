require 'rails_helper'

RSpec.describe 'Event', type: :request do
  let(:event) { create(:event) }
  let!(:title) { create(:title) }
  let!(:spot) { create(:spot) }

  describe "Event" do
    it 'GET index' do
      get events_path
      expect(response).to have_http_status(200)
    end

    it 'GET show' do
      get event_path(event)
      expect(response).to have_http_status(200) 
    end
  end
end
