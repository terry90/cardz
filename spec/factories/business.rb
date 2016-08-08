FactoryGirl.define do
  factory :business do
    sequence :name do |i|
      "#{Faker::Company.name} - #{i}"
    end
    # Uncomment to limit the nb
    # name { ['Business de poule', 'NASA', 'Dartagnans', 'Maman'].sample }
    # initialize_with { Group.find_or_create_by_name(name)}
  end
end