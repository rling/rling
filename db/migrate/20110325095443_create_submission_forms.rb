class CreateSubmissionForms < ActiveRecord::Migration
  def self.up
    create_table :submission_forms do |t|
      t.integer :object_form_id

      t.timestamps
    end
  end

  def self.down
    drop_table :submission_forms
  end
end
