FactoryGirl.define do
  factory :business do
    name { Faker::Company.name }
  end
end