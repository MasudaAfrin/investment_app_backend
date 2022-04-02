FactoryBot.define do
  factory :campaign do
    name { Faker::Lorem.sentence }
    percentage_raised { Faker::Number.within(range: 1..100) }
    target_amount { Faker::Number.positive }
    investment_multiple { Faker::Number.within(range: 1..1000) }
    country_id { Country.first.id }
    sector_id { Sector.first.id }
  end
end
