require 'rails_helper'

RSpec.describe User, type: :model do
  describe '登録に成功' do
    it '名前、メール、パスワードがある場合、有効である' do
      user = build(:user)
      expect(user).to be_valid
    end
  end

  describe '登録に失敗' do
    describe '名前が無効' do
      it '名前がない' do
        user = build(:user, name: nil)
        user.valid?
        expect(user.errors[:name]).to include("can't be blank")
      end

      it '名前が20文字以上ある' do
        user = build(:user, name: ('a' * 21))
        user.valid?
        expect(user.errors[:name]).to include('is too long (maximum is 20 characters)')
      end
    end

    describe 'メールアドレスが無効' do
      it 'メールアドレスがない' do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end

      it '重複している' do
        user = create(:duplication_user)
        user2 = build(:duplication_user)
        user2.valid?
        expect(user2.errors[:email]).to include('has already been taken')
      end

      it 'aaa@aaa.aaaの形式でない' do
        user = build(:user, email: 'a')
        user.valid?
        expect(user.errors[:email]).to include('is invalid')
      end

      it '50文字以上ある' do
        user = build(:user, email: ('a' * 48 + '.com'))
        user.valid?
        expect(user.errors[:email]).to include('is too long (maximum is 50 characters)')
      end
    end

    describe 'パスワードが無効' do
      it 'パスワードがない場合、無効である' do
        user = build(:user, password_digest: nil)
        user.valid?
        expect(user.errors[:password_digest]).to include("can't be blank")
      end
    end
  end
end
