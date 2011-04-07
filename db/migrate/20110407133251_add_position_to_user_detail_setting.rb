class AddPositionToUserDetailSetting < ActiveRecord::Migration
  def self.up
    add_column :user_detail_settings, :position, :integer ,:default => 0
  end

  def self.down
    remove_column :user_detail_settings, :position
  end
end
