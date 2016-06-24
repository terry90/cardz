FactoryGirl.define do
  factory :location do
    lat { Faker::Address.latitude }
    lng { Faker::Address.longitude }
    name { Faker::Address.city }
    business
  end
end