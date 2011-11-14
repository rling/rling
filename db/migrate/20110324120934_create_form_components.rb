class CreateFormComponents < ActiveRecord::Migration
  def self.up
    create_table :form_components do |t|
      t.integer :object_form_id
      t.string :component_name
      t.string :component_type
      t.text :component_values
      t.string :default_value
      t.boolean :mandatory,:default=>false
      t.timestamps
    end
  end

  def self.down
    drop_table :form_components
  end
end
