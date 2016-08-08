FactoryGirl.define do
  factory :card do
    uid SecureRandom.hex(6)
    user_id nil
    location_id { create(:location).id }
  end
end