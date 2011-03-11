class CreatePageVariableSettings < ActiveRecord::Migration
  def self.up
    create_table :page_variable_settings do |t|
      t.string :name
      t.text :default_value
      t.timestamps
    end
  end

  def self.down
    drop_table :page_variable_settings
  end
end
