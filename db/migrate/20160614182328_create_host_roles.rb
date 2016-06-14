class CreateHostRoles < ActiveRecord::Migration
  def change
    create_table :host_roles do |t|
      t.string :smoking_preference, default: "no preference"
      t.string :pet_preference, default: "no preference"
      t.references :member, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
