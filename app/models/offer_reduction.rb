class OfferReduction < ApplicationRecord
  belongs_to :location

  has_attached_file :cover, styles: { big: '1200x600', medium: '800x400>', small: '400x200>' }, default_url: 'default/offer_reduction_cover.png'
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/, size: { in: 0..2.megabytes }

  validates_presence_of :name, :uid
end
