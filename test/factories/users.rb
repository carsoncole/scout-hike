FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    screenname { Faker::Internet.username(specifier: 8..15) }
    password { Faker::Internet.password }
    unit
  end
end
