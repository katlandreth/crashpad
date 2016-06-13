class CreateGuestRoles < ActiveRecord::Migration
  def change
    create_table :guest_roles do |t|
      t.string :smoking_preference
      t.string :pet_preference
      t.references :member, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
