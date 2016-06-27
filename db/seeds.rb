# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require_relative 'seeds/helpers'
require_relative 'seeds/users'
require_relative 'seeds/cards'
require_relative 'seeds/offers'
require_relative 'seeds/locations'
require_relative 'seeds/businesses'

create_businesses
create_locations
create_offers
create_cards
create_users
