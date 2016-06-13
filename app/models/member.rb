class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :guest_role
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, uniqueness: { case_sensitive: true }
  validates_format_of :email, with: /.+@.+\..+/i

  validates :password, presence: true, length: { minimum: 8 }

end
