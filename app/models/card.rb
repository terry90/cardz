class Card < ApplicationRecord
  belongs_to :user
  belongs_to :location

  validates_presence_of :location
  validates_presence_of :uid

  before_create :generate_uid

  private

  def generate_uid
    self.uid = loop do
      new_uid = [*('a'..'z'), *('0'..'9')].sample(6).join.upcase
      break new_uid unless Card.exists?(uid: new_uid)
    end
  end
end