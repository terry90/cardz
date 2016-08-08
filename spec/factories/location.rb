FactoryGirl.define do
  factory :location do
    lat { Faker::Address.latitude }
    lng { Faker::Address.longitude }
    sequence :name do |i|
      "#{Faker::Address.city} - #{i}"
    end
    business_id { create(:business).id }
  end
end