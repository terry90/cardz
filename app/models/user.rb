class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: 'default/user_avatar.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/, size: { in: 0..2.megabytes }
  has_many :cards

  validates_presence_of :cards

  # We ask the password only after email confirmation (progressive engagement)
  def password_required?
    super if confirmed?
  end

  # Linked to progressive engagement (See confirmations_controller)
  def password_match?
    self.errors[:password] << 'can\'t be blank' if password.blank?
    self.errors[:password_confirmation] << 'can\'t be blank' if password_confirmation.blank?
    self.errors[:password_confirmation] << 'does not match password' if password != password_confirmation
    password == password_confirmation && !password.blank?
  end
end
