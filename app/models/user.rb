class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :cards
  validates_presence_of :cards

  accepts_nested_attributes_for :cards

  def password_required?
    super if confirmed?
  end

  def password_match?
    self.errors[:password] << 'can\'t be blank' if password.blank?
    self.errors[:password_confirmation] << 'can\'t be blank' if password_confirmation.blank?
    self.errors[:password_confirmation] << 'does not match password' if password != password_confirmation
    password == password_confirmation && !password.blank?
  end

  def completion_percentage
    fields = %w(email first_name last_name address postal_code city phone_number cards)
    sum_add = 100.0 / fields.count
    fields.inject(0) { |sum, field| sum + (field.split('.').inject(self) { |us, o| us.send(o) }.blank? ? 0 : sum_add) }.round.to_i
  end
end
