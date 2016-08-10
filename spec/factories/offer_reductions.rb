FactoryGirl.define do
  factory :offer_reduction do
    name '20% off'
    title '20% off'
    percent 1
    uid '298IDJ'
    location_id { create(:location).id }
    description '20% off on all the shop'
  end
end
