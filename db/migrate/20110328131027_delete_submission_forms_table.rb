class DeleteSubmissionFormsTable < ActiveRecord::Migration
  def self.up
 execute "DROP TABLE IF EXISTS submission_forms"
  end

  def self.down
  end
end
