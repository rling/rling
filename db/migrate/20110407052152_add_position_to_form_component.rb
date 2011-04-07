class AddPositionToFormComponent < ActiveRecord::Migration
  def self.up
    add_column :form_components, :position, :integer ,:default => 0
  end

  def self.down
    remove_column :form_components, :position
  end
end
