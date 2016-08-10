FactoryGirl.define do
  factory :business do
    sequence :name do |i|
      "#{Faker::Company.name} - #{i}"
    end
  end
end