class CreateUserDetails < ActiveRecord::Migration
  def self.up
    create_table :user_details do |t|
      t.column :user_id,:integer
      t.column :user_detail_setting_id,:integer
      t.column :selected_value,:text
      t.timestamps
    end
  end

  def self.down
    drop_table :user_details
  end
end
