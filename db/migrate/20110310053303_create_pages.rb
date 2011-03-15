class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :title
      t.text :body
      t.string :perma_link
      t.boolean :home_page ,:default => false
      t.integer :page_view_type ,:default => 0
      t.integer :user_id 
      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
