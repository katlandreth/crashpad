class Location < ActiveRecord::Base
  belongs_to :host_role
  has_many :location_images, dependent: :destroy
  accepts_nested_attributes_for :location_images

  validates :name, presence: true
  validates :location_street, presence: true
  validates :location_city, presence: true
  validates :location_zip, presence: true
  validates_format_of :location_zip, :with => /\A\d{5}(-\d{4})?\z/, :message => "should be in the form 12345 or 12345-1234"
end
