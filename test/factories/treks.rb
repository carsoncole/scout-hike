FactoryBot.define do
  factory :trek do
    user
    distance_in_miles { rand(100) / 100.00 }
    date { Date.today - (rand(3)+1).days }
  end
end
