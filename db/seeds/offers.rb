def create_offers(nb = 10)
  puts '- Creating offers -'
  nb.times do
    raise 'Create location first' unless Business.count != 0

    OfferReduction.create!(name: Faker::Commerce.product_name,
                     percent: Random.rand(100) + 1, uid: SecureRandom.hex(6), location: Location.order('RANDOM()').first,
                     title: Faker::Commerce.product_name.underscore.gsub(' ', '_').gsub(/[^0-9A-Za-z]/, ''))
    print '.'
  end
  puts
end