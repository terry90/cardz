class Card < ApplicationRecord
  belongs_to :user
  belongs_to :location

  validates_uniqueness_of :uid
end
