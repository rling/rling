class AddIsCommentRecursiveToObjectModel < ActiveRecord::Migration
  def self.up
    add_column :object_models, :is_comment_recursive, :boolean ,:default => 0
  end

  def self.down
    remove_column :object_models, :is_comment_recursive
  end
end
