class CreateCommentSubmissions < ActiveRecord::Migration
  def self.up
    create_table :comment_submissions do |t|
      t.integer :model_submission_id
      t.integer :parent_id
      t.userstamps
      t.timestamps
    end
  end

  def self.down
    drop_table :comment_submissions
  end
end
