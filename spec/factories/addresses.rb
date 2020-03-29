FactoryBot.define do
  factory :address do
    postcode                 {1112222}
    prefecture               {"東京都"}
    municipality             {"北区"}
    address                  {"32−3"}
    building                 {"アジアビル3F"}
    user                     nil
  end
end
