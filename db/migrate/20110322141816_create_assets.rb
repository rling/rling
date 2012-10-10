class CreateAssets < ActiveRecord::Migration
  def self.up
    create_table :assets do |t|
      t.string :upload_file_name
      t.string :upload_content_type
      t.integer :upload_file_size
      t.timestamps
    end
  end

  def self.down
    drop_table :assets
  end
end
