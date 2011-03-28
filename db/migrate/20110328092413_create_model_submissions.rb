class CreateModelSubmissions < ActiveRecord::Migration
  def self.up
    create_table :model_submissions do |t|
      t.integer :object_model_id
      t.string :perma_link
      t.boolean :home_page
      t.integer :page_view_type ,:default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :model_submissions
  end
end
