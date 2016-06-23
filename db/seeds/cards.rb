def create_cards(users)
  raise 'Create users first' unless users.size != 0
  raise 'Create locations first' unless Location.count != 0

  puts 'Creating cards...'
  users.size.times do |i|
    c = Card.new(uid: SecureRandom.hex(8), location: Location.order('RANDOM()').first)
    users[i].cards << c
    users[i].save!
    print '.'
  end
  puts
end