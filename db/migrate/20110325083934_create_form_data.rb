class CreateFormData < ActiveRecord::Migration
  def self.up
    create_table :form_data do |t|
      t.integer :form_component_id
      t.integer :submission_form_id
      t.string :data_value

      t.timestamps
    end
  end

  def self.down
    drop_table :form_data
  end
end