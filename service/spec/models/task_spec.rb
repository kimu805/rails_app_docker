require 'rails_helper'

RSpec.describe Task, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @task = FactoryBot.build(:task, user: @user)
  end

  describe "validation" do
    context "正常系" do
      it "名前があれば登録できる。" do
        expect(@task).to be_valid
      end

      it "詳しい説明がなくても登録できる。" do
        @task.description = ""
        expect(@task).to be_valid
      end
    end

    context "異常系" do
      it "名前がなければ、登録できない。" do
        @task.name = ""
        @task.valid?
        expect(@task.errors.full_messages).to include("名称を入力してください")
      end

      it "名前が30文字より多ければ、登録できない。" do
        @task.name = "テストテストテストテストテストテストテストテストテストテストテスト"
        @task.valid?
        expect(@task.errors.full_messages).to include("名称は30文字以内で入力してください")
      end
      it "名前にカンマが含まれていれば、登録できない" do
        @task.name = "テス,ト"
        @task.valid?
        expect(@task.errors.full_messages).to include("名称にカンマを含めることはできません")
      end

      it "userが紐付いていなければ、登録できない。" do
        @task.user = nil
        @task.valid?
        expect(@task.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
