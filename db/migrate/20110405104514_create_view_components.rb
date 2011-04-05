class CreateViewComponents < ActiveRecord::Migration
  def self.up
    create_table :view_components do |t|
      t.integer :view_id
      t.string :name
      t.boolean :is_linked ,:default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :view_components
  end
end
