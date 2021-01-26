FactoryBot.define do
  factory :unit do
    name { "Troop #{rand(1000)} #{Faker::Address.city}, #{Faker::Address.state_abbr}" }
    start_date { Date.today - 2.days }
    end_date { Date.today + 25.days }
    miles_goal { 10 }
  end
end
