CARD_UIDS = %w(XYWXYW 123456 12E3456N OLOL OMG6942)

def create_cards
  raise 'Create users first' unless User.count != 0
  raise 'Create locations first' unless Location.count != 0

  puts 'Creating cards...'
  CARD_UIDS.each do |uid|
    Card.create(uid: uid, user: User.order('RANDOM()').first, location: Location.order('RANDOM()').first)
    print '.'
  end
  puts
end