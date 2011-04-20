class AddUserStampsToModelData < ActiveRecord::Migration
    def self.up
    add_column :model_data, :creator_id, :integer
    add_column :model_data, :updater_id, :integer
  end

  def self.down
    remove_column :model_data, :creator_id
    remove_column :model_data, :updater_id
  end
end
