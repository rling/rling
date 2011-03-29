class CreatePermissions < ActiveRecord::Migration
  def self.up
    create_table :permissions do |t|
      t.integer :role_id
      t.string :permission_object
      t.string :permission_type
      t.string :activity_code
      t.string :activity_display_text
      t.boolean :status

      t.timestamps
    end
  end

  def self.down
    drop_table :permissions
  end
end
