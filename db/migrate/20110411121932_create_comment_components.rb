class CreateCommentComponents < ActiveRecord::Migration
  def self.up
    create_table :comment_components do |t|
      t.integer :object_model_id
      t.string :component_name
      t.string :component_display_name
      t.string :component_type
      t.text :component_values
      t.string :default_value
      t.boolean :mandatory ,:default=>0
      t.integer :position , :default =>0

      t.timestamps
    end
  end

  def self.down
    drop_table :comment_components
  end
end
