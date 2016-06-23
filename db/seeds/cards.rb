CARD_UIDS = %w(XYWXYW 123456 12E3456N OLOL OMG6942)

def create_cards
  CARD_UIDS.each do |uid|
    Card.create(uid: uid, user: User.order('RANDOM()').first)
  end
end