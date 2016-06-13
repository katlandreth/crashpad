class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :smoker
      t.boolean :pet_owner
      t.string :image
      t.references :member, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
