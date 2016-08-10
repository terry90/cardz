FactoryGirl.define do
  factory :user do
    after(:create) do |u|
      u.confirm
    end

    sequence :email do |i|
      "test-#{i}@cardz.com"
    end
    first_name 'Ganesh'
    last_name 'Desfleurs'
    password 'grospassworddefou'
    address '15 rue du fake'
    postal_code '75011'
    city 'Paris'
    phone_number '0982619256'
    birthday Date.today - (Random.rand(30) + 18).years - Random.rand(365).days
  end
end
