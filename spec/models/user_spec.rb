require 'rails_helper'

describe User do
  describe '#create' do

    it "is valid with a email, password, password_confirmation, nickname, familyname, firstname, familyname_kana, firstname_kana, birthday" do
      user = build(:user)
      expect(user).to be_valid
    end

    # emailに関するテスト

    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "is invalid without an email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # パスワードに関するテスト

    it "is invalid without a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "is invalid with a password that has less than 6 characters" do
      user = build(:user, password: "abcd12", password_confirmation: "abcd12")
      user.valid?
      expect(user.errors[:password]).to include("７文字以上の英数混在で入力してください。")
    end

    it "is invalid with a password that has more than 7 characters but has only number" do
      user = build(:user, password: "1234567", password_confirmation: "1234567")
      user.valid?
      expect(user.errors[:password]).to include("７文字以上の英数混在で入力してください。")
    end

    it "is invalid with a password that has more than 7 characters but has only letter" do
      user = build(:user, password: "abcdefg", password_confirmation: "abcdefg")
      user.valid?
      expect(user.errors[:password]).to include("７文字以上の英数混在で入力してください。")
    end

    it "is valid with a password that has more than 7 characters an has both of number and letter" do
      user = build(:user, password: "abcd123", password_confirmation: "abcd123")
      user.valid?
      expect(user).to be_valid
    end

    # ニックネームに関するテスト

    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end
    
    it "is invalid with a nickname that has more than 20 characters" do
      user = build(:user, nickname: "abcdeabcdeabcdeabcdea")
      user.valid?
      expect(user.errors[:nickname]).to include("is too long (maximum is 20 characters)")
    end

    # 誕生日に関するテスト

    it "is invalid without a birthday" do
      user = build(:user, birthday: "")
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end

    # 姓(セイ)に関するテスト

    it "is invalid without a familyname" do
      user = build(:user, familyname: "")
      user.valid?
      expect(user.errors[:familyname]).to include("can't be blank")
    end

    it "is invalid without a familyname_kana" do
      user = build(:user, familyname_kana: "")
      user.valid?
      expect(user.errors[:familyname_kana]).to include("can't be blank")
    end

    it "is invalid with Hiragana" do
      user = build(:user, familyname_kana: "せい")
      user.valid?
      expect(user.errors[:familyname_kana]).to include("全角カタカナのみで入力して下さい")
    end

    # 名(メイ)に関するテスト

    it "is invalid without a firstname" do
      user = build(:user, firstname: "")
      user.valid?
      expect(user.errors[:firstname]).to include("can't be blank")
    end

    it "is invalid without a firstname_kana" do
      user = build(:user, firstname_kana: "")
      user.valid?
      expect(user.errors[:firstname_kana]).to include("can't be blank")
    end

    it "is invalid with Hiragana" do
      user = build(:user, firstname_kana: "めい")
      user.valid?
      expect(user.errors[:firstname_kana]).to include("全角カタカナのみで入力して下さい")
    end

    # 電話番号に関するテスト

    it "is invalid without a cellphone" do
      user = build(:user, cellphone: "")
      user.valid?
      expect(user.errors[:cellphone]).to include("can't be blank")
    end

    it "is valid without a phone" do
      user = build(:user, phone: "")
      expect(user).to be_valid
    end
    
  end
end