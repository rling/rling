class AddCommentComponentIdToObjectModel < ActiveRecord::Migration
  def self.up
    add_column :object_models, :comment_component_id, :integer
  end

  def self.down
    remove_column :object_models, :comment_component_id
  end
end
