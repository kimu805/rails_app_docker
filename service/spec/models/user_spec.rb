require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "validation" do
    context "正常系" do
      it "名前とメールアドレスとパスワードとパスワード（確認）があれば、登録できる" do
        expect(@user).to be_valid
      end
    end

    context "異常系" do
      it "名前がなければ、登録できない。" do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end

      it "メールアドレスがなければ、登録できない。" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
      end
      it "メールアドレスが一意でなければ、登録できない。" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("メールアドレスはすでに存在します")
      end
      it "パスワードがなければ、登録できない。" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "パスワード（確認）がなければ、登録できない。" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認）とパスワードの入力が一致しません")
      end
      it "パスワードとパスワード（確認）が同じでなければ、登録できない。" do
        @user.password = "123456"
        @user.password_confirmation = "654321"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認）とパスワードの入力が一致しません")
      end
    end
  end
end
