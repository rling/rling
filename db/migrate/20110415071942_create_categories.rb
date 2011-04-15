class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.integer :categoryset_id
      t.integer :parent_id        ,:default => 0
      t.integer :level            ,:default => 0
      t.integer :position         ,:default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :categories
  end
end
