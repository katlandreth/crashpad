class HostRole < ActiveRecord::Base
  belongs_to :member
  has_many :locations
end
