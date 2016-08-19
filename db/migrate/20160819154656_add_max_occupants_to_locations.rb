class AddMaxOccupantsToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :max_occupants, :integer
  end
end
