def create_cards(nb = 200)
  raise 'Create locations first' unless Location.count != 0

  puts '- Creating cards -'
  nb.times do |i|
    Card.create!(location: Location.order('RANDOM()').first)
    print '.'
  end
  puts
end