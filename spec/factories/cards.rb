FactoryBot.define do
  factory :card do
    card_number               {"4242424242424242"}
    expiration_month          {"09"}
    expiration_year           {"22"}
    security_code             {"765"}
    user                      nil
  end
end
