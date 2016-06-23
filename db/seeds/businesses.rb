def create_businesses(nb = 2)
  puts '- Creating businesses -'

  nb.times do
    Business.create!(name: Faker::Company.name)
    print '.'
  end
  puts
end