FactoryBot.define do
  factory :item do
    image           {Faker::Lorem.sentence}
    item_name       {Faker::Name.initials(number: 2)}
    item_detail     {'test'}
    price           {Faker::Number.between(from: 300, to: 9999999)}
    category_id     {'1'}
    item_state_id   {'1'}
    delivery_fee_id {'1'}
    prefecture_id   {'1'}
    spend_day_id    {'1'}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/image.JPG'), filename: 'image.JPG')
    end
    
  end
end