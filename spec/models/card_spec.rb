require 'rails_helper'

RSpec.describe Card, type: :model do
  it "is valid with a card_number, expiration_month, expiration_year, security_code" do
    card = build(:card)
    expect(card).to be_valid
  end

  it "is invalid without a card_number" do
    card = build(:card, card_number: "")
    card.valid?
    expect(card.errors[:card_number]).to include("can't be blank")
  end

  it "is invalid with a card_number composed of letters" do
    card = build(:card, card_number: "sample_code")
    card.valid?
    expect(card.errors[:card_number]).to include("is not a number")
  end

  it "is invalid without a expiration_month" do
    card = build(:card, expiration_month: "")
    card.valid?
    expect(card.errors[:expiration_month]).to include("can't be blank")
  end

  it "is invalid without a expiration_year" do
    card = build(:card, expiration_year: "")
    card.valid?
    expect(card.errors[:expiration_year]).to include("can't be blank")
  end

  it "is invalid without a security_code" do
    card = build(:card, security_code: "")
    card.valid?
    expect(card.errors[:security_code]).to include("can't be blank")
  end

  it "is invalid with a security_code that has less than 3 characters" do
    card = build(:card, security_code: "11")
    card.valid?
    expect(card.errors[:security_code]).to include("is too short (minimum is 3 characters)")
  end

  it "is invalid with a security_code that has more than 4 characters" do
    card = build(:card, security_code: "11111")
    card.valid?
    expect(card.errors[:security_code]).to include("is too long (maximum is 4 characters)")
  end
end
