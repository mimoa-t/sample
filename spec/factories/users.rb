FactoryBot.define do
  factory :user do
    email                 {"aaa@gmail.com"}
    password              {"aaaa0000"}
    password_confirmation {"aaaa0000"}
    nickname              {"test_user"}
    familyname            {"姓"}
    firstname             {"名"}
    familyname_kana       {"セイ"}
    firstname_kana        {"メイ"}
    birthday              {"1993-09-22"}
    cellphone             {"08011112222"}
    phone                 {"0322221111"}
  end

  factory :user_with_address, class: User do
    email                 {"aaa@gmail.com"}
    password              {"aaaa0000"}
    password_confirmation {"aaaa0000"}
    nickname              {"test_user"}
    familyname            {"姓"}
    firstname             {"名"}
    familyname_kana       {"セイ"}
    firstname_kana        {"メイ"}
    birthday              {"1993-09-22"}
    cellphone             {"08011112222"}
    phone                 {"0322221111"}

    after( :create ) do |user|
      create :address, user: user
    end
  end

  factory :user_with_card, class: User do
    email                 {"aaa@gmail.com"}
    password              {"aaaa0000"}
    password_confirmation {"aaaa0000"}
    nickname              {"test_user"}
    familyname            {"姓"}
    firstname             {"名"}
    familyname_kana       {"セイ"}
    firstname_kana        {"メイ"}
    birthday              {"1993-09-22"}
    cellphone             {"08011112222"}
    phone                 {"0322221111"}

    after( :create ) do |user|
      create :card, user: user
    end
  end  
end