class GuestRole < ActiveRecord::Base
  belongs_to :member

  def locations_link
    nil
    # link_to 'Browse Locations', locations_path
  end
end
