class RemoveAttributesFromPermissions < ActiveRecord::Migration
  def self.up
    remove_column :permissions, :role_id
    remove_column :permissions, :status
  end

  def self.down
  end
end
