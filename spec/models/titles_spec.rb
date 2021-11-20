require 'rails_helper'

RSpec.describe Title, type: :model do
  it "タイトル名がある場合、有効である" do
    title = build(:title)
    expect(title).to be_valid
  end

  it "タイトル名がない場合、無効である" do
    title = build(:title, name: nil)
    title.valid?
    expect(title.errors[:name]).to include("can't be blank")
  end
end
