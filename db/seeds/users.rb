def new_users(nb = 10)

  puts 'Creating users...'
  ar = []
  nb.times do |i|
    ar << User.new(email: Faker::Internet.email, password: SecureRandom.hex(8))
    print '.'
  end
  puts
  ar
end