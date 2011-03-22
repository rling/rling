class CreateAssets < ActiveRecord::Migration
  def self.up
    create_table :assets do |t|
      t.string :file_name
      t.string :file_content_type
      t.string :file_size
      t.timestamps
    end
  end

  def self.down
    drop_table :assets
  end
end
