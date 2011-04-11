class CreateCommentData < ActiveRecord::Migration
  def self.up
    create_table :comment_data do |t|
      t.integer :comment_component_id
      t.integer :comment_submission_id
      t.string :data_value

      t.timestamps
    end
  end

  def self.down
    drop_table :comment_data
  end
end
