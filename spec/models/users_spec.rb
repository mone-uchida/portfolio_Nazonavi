require 'rails_helper'

RSpec.describe User, type: :model do
  it "名前、メール、パスワードがある場合、有効である" do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  it "名前がない場合、無効である" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "メールアドレスがない場合、無効である"  do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "重複したメールアドレスの場合、無効である" do
    user1 = FactoryBot.create(:duplication_user)
    user2 = FactoryBot.build(:duplication_user)
    user2.valid?
    expect(user2.errors[:email]).to include("has already been taken")
  end

  it "パスワードがない場合、無効である" 
    user = FactoryBot.build(:user, password_digest: nil)
    user.valid?
    expect(user.errors[:password_digest]).to include("can't be blank")
  end
end
