FactoryBot.define do
  factory :item do
    item_name       {Faker::Name.initials(number: 2)}
    item_detail     {'test'}
    price           {Faker::Internet.price(min: 300, max: 9999999)}
    category_id     {'1'}
    item_state_id   {'1'}
    delivery_fee_id {'1'}
    prefecture_id   {'1'}
    spend_day_id    {'1'}
  end
end