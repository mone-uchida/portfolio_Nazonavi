require 'rails_helper'

RSpec.describe Post, type: :model do
  let!(:user) { create(:user) }
  let!(:title) { create(:title) }

  it "タイトル、投稿内容がある場合、有効である" do
    post = build(:post)
    expect(post).to be_valid
  end

  it "タイトルがない場合、無効である" do
    post = build(:post, title_id: nil)
    post.valid?
    expect(post.errors[:title]).to include("must exist")
  end

  it "投稿内容がない場合、無効である"  do
    post = build(:post, content: nil)
    post.valid?
    expect(post.errors[:content]).to include("can't be blank")
  end
end
