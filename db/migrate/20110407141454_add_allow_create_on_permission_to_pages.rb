class AddAllowCreateOnPermissionToPages < ActiveRecord::Migration
  def self.up
    add_column :pages,:allow_create_on_permission, :boolean, :default=>false
  end

  def self.down
    remove_column :pages,:allow_create_on_permission
  end
end
