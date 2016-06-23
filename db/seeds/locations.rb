def create_locations(nb = 10)
  puts 'Creating locations...'
  nb.times do
    raise 'Create businesses first' unless Business.count != 0

    Location.create!(business: Business.order('RANDOM()').first,
                    lat: Faker::Address.latitude, lng: Faker::Address.longitude,
                    name: Faker::Address.city)
    print '.'
  end
  puts
end