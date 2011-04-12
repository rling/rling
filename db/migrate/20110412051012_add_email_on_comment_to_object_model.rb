class AddEmailOnCommentToObjectModel < ActiveRecord::Migration
  def self.up
    add_column :object_models, :email_on_comment, :boolean ,:default=>false
  end

  def self.down
    remove_column :object_models, :email_on_comment
  end
end
