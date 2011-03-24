class CreateMenus < ActiveRecord::Migration
  def self.up
    create_table :menus do |t|
      t.string :name             
      t.integer :position         ,:default => 0
      t.integer :level            ,:default => 0
      t.string :image_path
      t.string :hover_image_path
      t.string :link_path
      t.integer :parent_id        ,:default => 0
      t.integer :menuset_id
      t.integer :page_id
      t.integer :menu_view_type   ,:default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :menus
  end
end
