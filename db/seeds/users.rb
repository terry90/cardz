def create_users(nb = 10)
  raise 'Create cards first' unless Card.count != 0

  puts '- Creating users -'
  nb.times do
    User.create!(email: Faker::Internet.email, password: SecureRandom.hex(8),
                 cards: [Card.order('RANDOM()').first], avatar: lolcat)
    print '.'
  end
  puts
end