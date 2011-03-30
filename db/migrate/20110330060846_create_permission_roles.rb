class CreatePermissionRoles < ActiveRecord::Migration
  def self.up
    create_table :permission_roles do |t|
      t.integer :permission_id
      t.integer :role_id
      t.boolean :value
      t.timestamps
    end
  end

  def self.down
    drop_table :permission_roles
  end
end
