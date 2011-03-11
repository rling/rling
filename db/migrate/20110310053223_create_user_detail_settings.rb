class CreateUserDetailSettings < ActiveRecord::Migration
  def self.up
    create_table :user_detail_settings do |t|
      t.column :field_name, :string
      t.column :field_type, :string
      t.column :field_values, :text
      t.column :default_value, :string
      t.column :mandatory, :boolean,:default=>false 
      t.timestamps
    end
  end

  def self.down
    drop_table :user_detail_settings
  end
end
