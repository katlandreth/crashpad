class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.text :description
      t.string :location_street
      t.string :location_city
      t.string :location_zip

      t.timestamps null: false
    end
  end
end
