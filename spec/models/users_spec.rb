require 'rails_helper'

RSpec.describe User, type: :model do
  describe "登録に成功" do
    it "名前、メール、パスワードがある場合、有効である" do
      user = build(:user)
      expect(user).to be_valid
    end
  end

  describe "登録に失敗" do
    describe "名前が無効" do
      it "名前がない" do
        expect(build(:user, name: nil)).to_not be_valid
      end

      it "名前が20文字以上ある" do
        expect(build(:user, name: ("a" * 21))).to_not be_valid
      end
    end

    describe "メールアドレスが無効" do
      it "メールアドレスがない"  do
        expect(build(:user, email: nil)).to_not be_valid
      end

      it "重複している" do
        user1 = create(:duplication_user)
        user2 = buildrspec ./spec/models/users_spec.rb(:duplication_user)
        expect(user2).to_not be_valid
      end

      it "aaa@aaa.aaaの形式でない" do
        expect(build(:user, email: "a")).to_not be_valid
      end

      it "50文字以上ある" do
        expect(build(:user, name: ("a" * 48 + ".com"))).to_not be_valid
      end
    end

    describe "パスワードが無効" do
      it "パスワードがない場合、無効である" do
        expect(build(:user, password_digest: "")).to_not be_valid 
      end
    end
  end
end
