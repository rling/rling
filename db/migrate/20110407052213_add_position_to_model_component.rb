class AddPositionToModelComponent < ActiveRecord::Migration
  def self.up
    add_column :model_components, :position, :integer ,:default => 0
  end

  def self.down
    remove_column :model_components, :position
  end
end
