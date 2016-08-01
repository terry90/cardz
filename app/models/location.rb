class Location < ApplicationRecord
  belongs_to :business
  has_many :offer_reductions
  has_many :cards

  validates_presence_of :name
end
