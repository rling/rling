class AddPositionToViewComponent < ActiveRecord::Migration
  def self.up
    add_column :view_components, :position, :integer ,:default => 0
  end

  def self.down
    remove_column :view_components, :position
  end
end
