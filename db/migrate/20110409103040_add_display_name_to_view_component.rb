class AddDisplayNameToViewComponent < ActiveRecord::Migration
  def self.up
    add_column :view_components, :display_name, :string
  end

  def self.down
    remove_column :view_components, :display_name
  end
end
