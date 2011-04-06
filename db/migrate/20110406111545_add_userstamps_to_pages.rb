class AddUserstampsToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :creator_id, :integer
    add_column :pages, :updater_id, :integer
  end

  def self.down
    remove_column :pages, :creator_id
    remove_column :pages, :updater_id
  end
end
