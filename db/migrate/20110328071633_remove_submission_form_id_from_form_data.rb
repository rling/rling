class RemoveSubmissionFormIdFromFormData < ActiveRecord::Migration
  def self.up
    remove_column :form_data, :submission_form_id
  end

  def self.down
  add_column :form_data, :submission_form_id, :integer
  end
end
