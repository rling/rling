class AddLevelToCommentSubmission < ActiveRecord::Migration
  def self.up
    add_column :comment_submissions, :level, :integer, :default => 0
  end

  def self.down
    remove_column :comment_submissions, :level
  end
end
