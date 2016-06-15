class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :guest_role
  has_one :host_role
  has_one :profile
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false, message: "%{value} has already been taken" }
  validates_format_of :email, with: /.+@.+\..+/i, message: "%{value} needs to be in the format email@example.com"
  validates :password, presence: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true
  validates :password, confirmation: true

end
