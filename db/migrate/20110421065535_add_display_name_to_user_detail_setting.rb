class AddDisplayNameToUserDetailSetting < ActiveRecord::Migration
  def self.up
    add_column :user_detail_settings, :display_name, :string
  end

  def self.down
    remove_column :user_detail_settings, :display_name
  end
end
