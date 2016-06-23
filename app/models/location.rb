class Location < ApplicationRecord
  belongs_to :business
  has_many :cards
end
