class AddStatusToModelSubmission < ActiveRecord::Migration
  def self.up
    add_column :model_submissions,:status,:string
  end

  def self.down
   remove_column :model_submissions, :status
  end
end
