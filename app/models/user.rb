# A User is .. a user :)
class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: 'default/user_avatar.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/, size: { in: 0..2.megabytes }

  has_many :notifs, class_name: 'UserNotif::Notif'
  has_many :cards
  accepts_nested_attributes_for :cards

  validates_presence_of :cards
  validates :email, presence: true, uniqueness: true

  after_create :add_complete_notif

  # Whether or not the password is required.
  #
  # Only after account confirmation.
  def password_required?
    confirmed? ? super : false
  end

  # Linked to progressive engagement (See ConfirmationsController)
  def password_match?
    self.errors[:password] << 'can\'t be blank' if password.blank?
    self.errors[:password_confirmation] << 'can\'t be blank' if password_confirmation.blank?
    self.errors[:password_confirmation] << 'does not match password' if password != password_confirmation
    password == password_confirmation && !password.blank?
  end

  # Returns the user full name
  def full_name
    "#{first_name} #{last_name}"
  end

  # Returns the user profile completion percentage
  def completion_percentage
    fields = %w(first_name last_name address postal_code city country birthday phone_number avatar.present? )
    sum_add = 100.0 / fields.count
    fields.inject(0) { |sum, field| sum + (field.split('.').inject(self) { |us, o| us.send(o) }.blank? ? 0 : sum_add) }.round.to_i
  end

  # Returns the user offers ordered by location
  def offers_by_location
    offers = {}
    self.cards.each do |card|
      offers[card.location.name] = card.location.offer_reductions
    end
    offers
  end

  private

  # Creates the UserProfileCompletionNotif
  def add_complete_notif
    UserFormProgressNotif.create(user: self, target: self, sticky: true, unread: true)
  end
end
