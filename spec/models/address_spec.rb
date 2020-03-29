require 'rails_helper'

RSpec.describe Address, type: :model do
  it "is valid with a postcode, prefecture, municipality, address, building" do
    address = build(:address)
    expect(address).to be_valid
  end

  it "is invalid without a postcode" do
    address = build(:address, postcode: "")
    address.valid?
    expect(address.errors[:postcode]).to include("can't be blank")
  end

  it "is invalid without a prefecture" do
    address = build(:address, prefecture: "")
    address.valid?
    expect(address.errors[:prefecture]).to include("can't be blank")
  end

  it "is invalid without a municipality" do
    address = build(:address, municipality: "")
    address.valid?
    expect(address.errors[:municipality]).to include("can't be blank")
  end
  it "is invalid without an address" do
    address = build(:address, address: "")
    address.valid?
    expect(address.errors[:address]).to include("can't be blank")
  end

  it "is valid with a  building" do
    address = build(:address, building: "")
    expect(address).to be_valid
  end
end
