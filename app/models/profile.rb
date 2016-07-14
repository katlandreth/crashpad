class Profile < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_inclusion_of :smoker, in:[true, false]
  validates_inclusion_of :pet_owner, in:[true, false]

  mount_uploader :image, ProfileImageUploader

  def smoker?
    self.smoker
  end

  def pet_owner?
    self.pet_owner
  end

end
