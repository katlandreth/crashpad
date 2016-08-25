class CreateLocationImages < ActiveRecord::Migration
  def change
    create_table :location_images do |t|
      t.string :image
      t.references :location, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
