class AddDefaultValuesToGuestRole < ActiveRecord::Migration
  def up
    change_column :guest_roles, :smoking_preference, :string, default: "no preference"
    change_column :guest_roles, :pet_preference, :string, default: "no preference"
  end

  def down
  end
end
