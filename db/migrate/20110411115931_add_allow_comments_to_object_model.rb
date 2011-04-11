class AddAllowCommentsToObjectModel < ActiveRecord::Migration
  def self.up
    add_column :object_models, :allow_comments, :boolean ,:default => 0
  end

  def self.down
    remove_column :object_models, :allow_comments
  end
end
