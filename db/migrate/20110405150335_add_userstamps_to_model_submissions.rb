class AddUserstampsToModelSubmissions < ActiveRecord::Migration
  def self.up
    add_column :model_submissions, :creator_id, :integer
    add_column :model_submissions, :updater_id, :integer
  end

  def self.down
    remove_column :model_submissions, :creator_id
    remove_column :model_submissions, :updater_id
  end
end
