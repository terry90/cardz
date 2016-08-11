# A Business is the entity managing one or several Location.
#
# It should at least have a (unique) name.
class Business < ApplicationRecord
  has_many :locations

  has_attached_file :logo, styles: { big: '200x200', medium: '150x150>', small: '100x100>' }, default_url: 'default/business_logo.png'
  has_attached_file :cover, styles: { big: '1200x600', medium: '800x400>', small: '400x200>' }, default_url: 'default/business_cover.png'
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/, size: { in: 0..2.megabytes }
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/, size: { in: 0..1.megabytes }

  validates_presence_of :name
  validates_uniqueness_of :name, case_sensitive: false
end
