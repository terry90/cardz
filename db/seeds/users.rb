def create_users(nb = 10)

  puts 'Creating users...'
  nb.times do
    User.create(email: Faker::Internet.email, password: SecureRandom.hex(8))
    print '.'
  end
  puts
end