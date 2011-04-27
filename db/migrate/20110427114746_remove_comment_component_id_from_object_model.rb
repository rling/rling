class RemoveCommentComponentIdFromObjectModel < ActiveRecord::Migration
   def self.up
    remove_column :object_models, :comment_component_id
  end

  def self.down
  end
end
