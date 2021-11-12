FactoryBot.define do
  factory :company do
    name { Faker::Company.name }
    icon_url { Faker::Internet.url }
    ucode { Faker::Company.sic_code }
    country { Faker::Name }
  end
end
