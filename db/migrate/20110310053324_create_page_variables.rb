class CreatePageVariables < ActiveRecord::Migration
  def self.up
    create_table :page_variables do |t|
      t.integer :page_id
      t.integer :page_variable_setting_id
      t.text :variable_value

      t.timestamps
    end
  end

  def self.down
    drop_table :page_variables
  end
end
