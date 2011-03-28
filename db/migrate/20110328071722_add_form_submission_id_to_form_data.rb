class AddFormSubmissionIdToFormData < ActiveRecord::Migration
  def self.up
   add_column :form_data, :form_submission_id, :integer
  end

  def self.down
  remove_column :form_data, :form_submission_id
  end
end
