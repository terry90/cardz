# A Location represents a real location (managed by a Business)
#
# It can have many Card and OfferReduction
class Location < ApplicationRecord
  belongs_to :business
  has_many :offer_reductions
  has_many :cards

  validates_presence_of :name, :lng, :lat
end
