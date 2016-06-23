class Business < ApplicationRecord
  has_many :locations

  validates_uniqueness_of :name
end
