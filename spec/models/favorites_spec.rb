require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let!(:user) { create(:user) }
  let!(:title) { create(:title) }
  let!(:spot) { create(:spot) }
  let!(:event) { create(:event) }

  it 'タイトル名がある場合、有効である' do
    favorite = build(:favorite, user_id: 1, event_id: 1)
    expect(favorite).to be_valid
  end

  it 'user_idがない場合、無効である' do
    favorite = build(:favorite, user_id: nil)
    favorite.valid?
    expect(favorite.errors[:user_id]).to include("can't be blank")
  end

  it 'event_idがない場合、無効である' do
    favorite = build(:favorite, event_id: nil)
    favorite.valid?
    expect(favorite.errors[:event_id]).to include("can't be blank")
  end
end
