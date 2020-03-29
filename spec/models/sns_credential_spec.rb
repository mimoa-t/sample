require 'rails_helper'

RSpec.describe SnsCredential, type: :model do
  it " プロバイダーがfacebookであること " do
    provider = "facebook"
    expect(provider).to eq "facebook"
  end

  it " uidが取得できていること " do
    uid = SnsCredential.create(uid:)
    expect(uid).to eq "11111111"
  end

  it  'プロバイダは空にできない' do
    provider = SnsCredential.create(provider: nil)
    expect(provider.valid?).to eq (false)
  end

  it  'uidは空にできない' do
    uid = SnsCredential.create(uid: nil)
    expect(uid.valid?).to eq (false)
  end


end

