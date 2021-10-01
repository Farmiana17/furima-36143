FactoryBot.define do

  factory :user do
    nickname           {Faker::Name.initials(number: 2)}
    email              {Faker::Internet.free_email}
    password           {Faker::Internet.password(min_length: 6)}
    encrypted_password {password}
    last_name          {'鈴木'}
    first_name         {'太郎'}
    last_name_kana     {'スズキ'}
    first_name_kana    {'タロウ'}
    birthday           {'2020-01-01'}
  end

end