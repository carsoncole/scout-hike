FactoryBot.define do
  factory :setting do
    factory :active_setting do
      start_date { Date.today - 2.days }
      end_date { Date.today + 25.days }
    end
  end
end
