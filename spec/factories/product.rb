FactoryBot.define do
  factory :product do
    name {'ハムスター'}
    description {'かわいい'}
    # category {Faker::Number.between(from:1, to:100)}
    category {5}
    size {'小'}
    state {1}
    delivery_area {2}
    delivery_charge {2}
    delivery_date {3}
    delivery_method {4}
    price {1000}
    user {18}
    created_at {Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)}
    # name {Faker::Creature::Animal.name}
    # description {Faker::Lorem.sentence}
    # category_id {Faker::Number.between(from:1, to:1000)}
    # size {'小'}
    # state_id {Faker:: Number.between(from:1, to:6)}
    # delivery_area_id {Faker::Number.between(from:1, to:48)}
    # delivery_charge_id {Faker::Number.between(from:1, to:2)}
    # delivery_date_id {Faker::Number.between(from:1, to:3)}
    # delivery_method_id {Faker::Number.between(from:1, to:13)}
    # price {Faker::Number.between(from:1, to: 50000)}
    # user_id {Faker::Number.between(from:15, to:18)}
    # created_at {Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)}
  end
end