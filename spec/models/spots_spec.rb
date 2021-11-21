require 'rails_helper'

RSpec.describe Spot, type: :model do
  describe '登録ができる' do 
    it '会場、所在地、経度緯度がある場合、有効である' do
      spot = build(:spot)
      expect(spot).to be_valid
    end
  end

  describe '登録ができない' do
    it 'タイトル名がない場合、無効である' do
      spot = build(:spot, place: nil)
      spot.valid?
      expect(spot.errors[:place]).to include("can't be blank")
    end

    it '所在地がない場合、無効である' do
      spot = build(:spot, address: nil)
      spot.valid?
      expect(spot.errors[:address]).to include("can't be blank")
    end

    it '経度がない場合、無効である' do
      spot = build(:spot, lat: nil)
      spot.valid?
      expect(spot.errors[:lat]).to include("can't be blank")
    end

    it '緯度がない場合、無効である' do
      spot = build(:spot, lng: nil)
      spot.valid?
      expect(spot.errors[:lng]).to include("can't be blank")
    end
  end
end
