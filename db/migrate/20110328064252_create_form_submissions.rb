class CreateFormSubmissions < ActiveRecord::Migration
  def self.up
    create_table :form_submissions do |t|
      t.integer :object_form_id

      t.timestamps
    end
  end

  def self.down
    drop_table :form_submissions
  end
end
