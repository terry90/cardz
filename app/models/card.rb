# A Card represent is an entity that allow the User to creates an account.
#
# It is associated to a location and keeps a track of the user activity.
#
# It is identified through a unique identifier: :uid.
class Card < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :location

  validates_uniqueness_of :uid, case_sensitive: false
  validates :uid, presence: true, format: /\A[a-zA-Z0-9]{6,}\z/

  before_create :generate_uid

  private

  # Generates a unique uid
  def generate_uid
    self.uid = loop do
      new_uid = [*('a'..'z'), *('0'..'9')].sample(6).join.upcase
      break new_uid unless Card.exists?(uid: new_uid)
    end
  end
end