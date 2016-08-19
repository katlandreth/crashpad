class Location < ActiveRecord::Base

  belongs_to :host_role

  validates :name, presence: true
  validates :location_street, presence: true
  validates :location_city, presence: true
  validates :location_zip, presence: true
  validates_format_of :location_zip, :with => /\A\d{5}(-\d{4})?\z/, :message => "should be in the form 12345 or 12345-1234"
end
