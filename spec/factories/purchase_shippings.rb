FactoryBot.define do
  factory :purchase_shipping do
    post_number   { '123-4567' }
    prefecture_id { 1 }
    city          { '東京市' }
    address       { '東京1-1' }
    building      { '東京ハイツ101' }
    phone         { '09012345678' }
    token         { 'tok_abcdefghijk00000000000000000' }
  end
end
