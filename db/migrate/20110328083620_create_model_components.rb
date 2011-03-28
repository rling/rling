class CreateModelComponents < ActiveRecord::Migration
  def self.up
    create_table :model_components do |t|
      t.integer :object_model_id
      t.string :component_name
      t.string :component_display_name
      t.string :component_type
      t.text :component_values
      t.text :default_value
      t.boolean :is_mandatory, :default=>false
      t.boolean :is_deletable, :default=>true

      t.timestamps
    end
  end

  def self.down
    drop_table :model_components
  end
end
