class AddHostRoleToLocation < ActiveRecord::Migration
  def change
    add_reference :locations, :host_role, index: true, foreign_key: true
  end
end
