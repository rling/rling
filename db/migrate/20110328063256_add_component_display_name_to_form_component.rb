class AddComponentDisplayNameToFormComponent < ActiveRecord::Migration
  def self.up
    add_column :form_components, :component_display_name, :string
  end

  def self.down
    remove_column :form_components, :component_display_name
  end
end
