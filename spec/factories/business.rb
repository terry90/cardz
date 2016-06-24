FactoryGirl.define do
  factory :business do
    name { Faker::Company.name }
    # Uncomment to limit the nb
    # name { ['Business de poule', 'NASA', 'Dartagnans', 'Maman'].sample }
    # initialize_with { Group.find_or_create_by_name(name)}
  end
end