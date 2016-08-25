class LocationImage < ActiveRecord::Base
  mount_uploader :image, LocationImagesUploader
  belongs_to :location

end
